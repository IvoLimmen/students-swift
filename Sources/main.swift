struct Main {

    static func help() {
      print("Grading system")
      print("add-student [name] - Add student")
      print("select-student [name] - Select a student")
      print("add-grade [course] [grade] - Add a grade for a course for the current selected student")
      print("end - Stop the program")
    }

    static func main() {

        var student: Student? = nil
        var students: [Student] = []

        while true {
          print("Input command:")
          let command = readLine(strippingNewline: true)

          if command == nil {
            print("Please enter a valid command")
            help()
          }
          if command! == "end" || command! == "quit" {
            break
          }
          if  command == "help" {
            help()
          }
          if command!.starts(with: "add-student") {
            let name = String(command!.dropFirst(12))
            student = Student(name: name)
            students.append(student!)
          }
          if command!.starts(with: "select-student") {
            let name = String(command!.dropFirst(14))
            for i in students {
              if i.name == name {
                student = i
              }
            }

            if student == nil {
              print("Student \(name) not found")
            } else {
              print("Student \(name) selected")
            }
          }
          if command!.starts(with: "add-grade") {
            let args = String(command!).split(separator: " ")
            let course = args[1]
            let grade = args[2]

            if student == nil {
              print("No student is selected")
            } else {
              student!.addGrade(course: String(course), grade: Double(grade)!)
            }                        
          }
        }
        
        for s in students {
            s.totals()
        }
    }
}

Main.main()