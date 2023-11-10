class Course {
    var grades: [Double] = []
    var name: String

    init(name: String) {
        self.name = name
    }

    func addGrade(grade: Double) {
        grades.append(grade)
    }

    func total() {
        let count = self.grades.count
        var total:Double = 0
        for grade in self.grades {
           total += grade
        }
        let avg = Double(total) / Double(count)
        print("\(name) - \(count) exams - \(avg) avg")
    }
}