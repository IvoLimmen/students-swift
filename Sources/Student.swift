class Student {
    var courses: [Course] = []
    var name: String

    init(name: String) {
        self.name = name
    }

    func addGrade(course: String, grade: Double) {
        var c: Course? = nil
        for i in self.courses {
           if i.name == course {
                c = i
           }
        }

        if c == nil {
            c = Course(name: course)
            self.courses.append(c!)
        }
        c!.addGrade(grade: grade)
    }

    func totals() {
        print("Grades for \(name)")
        for c in self.courses {
            c.total()
        }
    }
}