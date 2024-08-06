import Foundation
import HealthKit
//
//class ActivityData: ObservableObject {
//    private var healthStore = HKHealthStore()
//    
//    @Published var steps: Int = 0
//    @Published var calories: Int = 0
//    @Published var distance: Double = 0
//    @Published var heartRate: Int = 0
//    @Published var sleep: Int = 0
//    @Published var weeklySteps: [(String, Int)] = []
//    
//    func requestAuthorization() {
//        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
//        let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
//        let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
//        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
//        let sleepType = HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!
//        
//        let typesToRead: Set<HKObjectType> = [stepType, calorieType, distanceType, heartRateType, sleepType]
//        
//        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
//            if success {
//                self.fetchSteps()
//                self.fetchCalories()
//                self.fetchDistance()
//                self.fetchHeartRate()
//                self.fetchSleep()
//                self.fetchWeeklySteps()
//            }
//        }
//    }
//    

import Foundation
import HealthKit

class ActivityData: ObservableObject {
    private var healthStore = HKHealthStore()
    
    @Published var steps: Int = 0
    @Published var calories: Int = 0
    @Published var distance: Double = 0
    @Published var heartRate: Int = 0
    @Published var sleep: Int = 0
    @Published var dailySteps: [(String, Int)] = []
    @Published var weeklySteps: [(String, Int)] = []
    @Published var monthlySteps: [(String, Int)] = []
    @Published var dailyCalories: [(String, Int)] = []
    @Published var weeklyCalories: [(String, Int)] = []
    @Published var monthlyCalories: [(String, Int)] = []
    
    func requestAuthorization() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let sleepType = HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!
        
        let typesToRead: Set<HKObjectType> = [stepType, calorieType, distanceType, heartRateType, sleepType]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if success {
                self.fetchSteps()
                self.fetchCalories()
                self.fetchDistance()
                self.fetchHeartRate()
                self.fetchSleep()
                self.fetchDailySteps()
                self.fetchWeeklySteps()
                self.fetchMonthlySteps()
                self.fetchDailyCalories()
                self.fetchWeeklyCalories()
                self.fetchMonthlyCalories()
            }
        }
    }
    
    func fetchSteps() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                return
            }
            DispatchQueue.main.async {
                self.steps = Int(sum.doubleValue(for: HKUnit.count()))
            }
        }
        healthStore.execute(query)
    }
    
    func fetchCalories() {
        let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: calorieType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                return
            }
            DispatchQueue.main.async {
                self.calories = Int(sum.doubleValue(for: HKUnit.kilocalorie()))
            }
        }
        healthStore.execute(query)
    }
    
    func fetchDistance() {
        let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                return
            }
            DispatchQueue.main.async {
                self.distance = sum.doubleValue(for: HKUnit.meter()) / 1000.0 // Convert to kilometers
            }
        }
        healthStore.execute(query)
    }
    
    func fetchHeartRate() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (_, samples, error) in
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
            let heartRates = samples.map { $0.quantity.doubleValue(for: HKUnit(from: "count/min")) }
            let totalHeartRates = heartRates.reduce(0, +)
            let avgHeartRate = totalHeartRates / Double(heartRates.count)
            
            DispatchQueue.main.async {
                if heartRates.count > 0 && !avgHeartRate.isNaN && !avgHeartRate.isInfinite {
                    self.heartRate = Int(avgHeartRate)
                } else {
                    self.heartRate = 0 // Or handle the error as needed
                }
            }
        }
        healthStore.execute(query)
    }

    func fetchSleep() {
        let sleepType = HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (_, samples, error) in
            guard let samples = samples as? [HKCategorySample] else {
                return
            }
            let sleepDuration = samples.reduce(0) { (sum, sample) -> TimeInterval in
                return sum + sample.endDate.timeIntervalSince(sample.startDate)
            }
            DispatchQueue.main.async {
                self.sleep = Int(sleepDuration / 3600) // Convert to hours
            }
        }
        healthStore.execute(query)
    }

    func fetchDailySteps() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)

        var interval = DateComponents()
        interval.hour = 1

        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfDay, intervalComponents: interval)

        query.initialResultsHandler = { _, results, error in
            guard let results = results else { return }

            var stepsData: [(String, Int)] = []
            results.enumerateStatistics(from: startOfDay, to: now) { (statistics, _) in
                let date = statistics.startDate
                let steps = statistics.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
                let hour = calendar.component(.hour, from: date)
                stepsData.append((String(format: "%02d:00", hour), Int(steps)))
            }
            DispatchQueue.main.async {
                self.dailySteps = stepsData
            }
        }
        healthStore.execute(query)
    }

    func fetchWeeklySteps() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let calendar = Calendar.current
        let now = Date()
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: now)!.start

        var interval = DateComponents()
        interval.day = 1

        let predicate = HKQuery.predicateForSamples(withStart: startOfWeek, end: now, options: .strictStartDate)

        let query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfWeek, intervalComponents: interval)

        query.initialResultsHandler = { _, results, error in
            guard let results = results else { return }

            var stepsData: [(String, Int)] = []
            results.enumerateStatistics(from: startOfWeek, to: now) { (statistics, _) in
                let date = statistics.startDate
                let steps = statistics.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
                let day = calendar.shortWeekdaySymbols[calendar.component(.weekday, from: date) - 1]
                stepsData.append((day, Int(steps)))
            }
            DispatchQueue.main.async {
                self.weeklySteps = stepsData
            }
        }
        healthStore.execute(query)
    }

    func fetchMonthlySteps() {
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let calendar = Calendar.current
        let now = Date()
        let startOfMonth = calendar.dateInterval(of: .month, for: now)!.start

        var interval = DateComponents()
        interval.day = 1

        let predicate = HKQuery.predicateForSamples(withStart: startOfMonth, end: now, options: .strictStartDate)

        let query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfMonth, intervalComponents: interval)

        query.initialResultsHandler = { _, results, error in
            guard let results = results else { return }

            var stepsData: [(String, Int)] = []
            results.enumerateStatistics(from: startOfMonth, to: now) { (statistics, _) in
                let date = statistics.startDate
                let steps = statistics.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
                let day = calendar.component(.day, from: date)
                stepsData.append((String(day), Int(steps)))
            }
            DispatchQueue.main.async {
                self.monthlySteps = stepsData
            }
        }
        healthStore.execute(query)
    }

    func fetchDailyCalories() {
        let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)

        var interval = DateComponents()
        interval.hour = 1

        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let query = HKStatisticsCollectionQuery(quantityType: calorieType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfDay, intervalComponents: interval)

        query.initialResultsHandler = { _, results, error in
            guard let results = results else { return }

            var caloriesData: [(String, Int)] = []
            results.enumerateStatistics(from: startOfDay, to: now) { (statistics, _) in
                let date = statistics.startDate
                let calories = statistics.sumQuantity()?.doubleValue(for: HKUnit.kilocalorie()) ?? 0
                let hour = calendar.component(.hour, from: date)
                caloriesData.append((String(format: "%02d:00", hour), Int(calories)))
            }
            DispatchQueue.main.async {
                self.dailyCalories = caloriesData
            }
        }
        healthStore.execute(query)
    }

    func fetchWeeklyCalories() {
        let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        let calendar = Calendar.current
        let now = Date()
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: now)!.start

        var interval = DateComponents()
        interval.day = 1

        let predicate = HKQuery.predicateForSamples(withStart: startOfWeek, end: now, options: .strictStartDate)

        let query = HKStatisticsCollectionQuery(quantityType: calorieType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfWeek, intervalComponents: interval)

        query.initialResultsHandler = { _, results, error in
            guard let results = results else { return }

            var caloriesData: [(String, Int)] = []
            results.enumerateStatistics(from: startOfWeek, to: now) { (statistics, _) in
                let date = statistics.startDate
                let calories = statistics.sumQuantity()?.doubleValue(for: HKUnit.kilocalorie()) ?? 0
                let day = calendar.shortWeekdaySymbols[calendar.component(.weekday, from: date) - 1]
                caloriesData.append((day, Int(calories)))
            }
            DispatchQueue.main.async {
                self.weeklyCalories = caloriesData
            }
        }
        healthStore.execute(query)
    }

    func fetchMonthlyCalories() {
        let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        let calendar = Calendar.current
        let now = Date()
        let startOfMonth = calendar.dateInterval(of: .month, for: now)!.start

        var interval = DateComponents()
        interval.day = 1

        let predicate = HKQuery.predicateForSamples(withStart: startOfMonth, end: now, options: .strictStartDate)

        let query = HKStatisticsCollectionQuery(quantityType: calorieType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfMonth, intervalComponents: interval)

        query.initialResultsHandler = { _, results, error in
            guard let results = results else { return }

            var caloriesData: [(String, Int)] = []
            results.enumerateStatistics(from: startOfMonth, to: now) { (statistics, _) in
                let date = statistics.startDate
                let calories = statistics.sumQuantity()?.doubleValue(for: HKUnit.kilocalorie()) ?? 0
                let day = calendar.component(.day, from: date)
                caloriesData.append((String(day), Int(calories)))
            }
            DispatchQueue.main.async {
                self.monthlyCalories = caloriesData
            }
        }
        healthStore.execute(query)
    }
}
