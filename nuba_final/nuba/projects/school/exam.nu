# School: Examination System
class Question {
    fun init(self, id, text, options, correct, marks) {
        self.id      = id
        self.text    = text
        self.options = options
        self.correct = correct
        self.marks   = marks
    }
}
class Exam {
    fun init(self, name, subject, duration_mins) {
        self.name     = name
        self.subject  = subject
        self.duration = duration_mins
        self.questions = []
        self.total_marks = 0
    }
    fun add_question(self, q) {
        push(self.questions, q)
        self.total_marks += q.marks
        return self
    }
    fun evaluate(self, student_name, answers) {
        let score = 0
        let correct_count = 0
        for i in 0..len(self.questions) {
            let q = self.questions[i]
            let ans = answers[i] if i < len(answers) else -1
            if ans == q.correct {
                score += q.marks
                correct_count += 1
            }
        }
        let pct = round(score * 100 / self.total_marks, 1)
        let grade = "A" if pct>=90 else ("B" if pct>=80 else ("C" if pct>=70 else ("D" if pct>=60 else "F")))
        print("=== Exam Result ===")
        print("Student:", student_name, "| Exam:", self.name)
        print(format("Score: {0}/{1} ({2}%) | Grade: {3}",
            score, self.total_marks, pct, grade))
        print("Correct:", correct_count, "/", len(self.questions))
        return {"score":score,"pct":pct,"grade":grade}
    }
}
let exam = new Exam("Mid-Term Math", "Mathematics", 90)
exam.add_question(new Question(1,"What is 2+2?",["3","4","5","6"],1,2))
exam.add_question(new Question(2,"What is 5*5?",["20","25","30","35"],1,2))
exam.add_question(new Question(3,"What is sqrt(144)?",["10","11","12","13"],2,3))
exam.add_question(new Question(4,"What is 100/4?",["20","25","30","15"],1,3))
let result = exam.evaluate("Alice", [1,1,2,1])
