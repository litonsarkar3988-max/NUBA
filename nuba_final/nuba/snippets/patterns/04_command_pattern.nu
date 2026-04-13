# Pattern: Command design pattern

class TextEditor {
    fun init(self) { self.text=""; self.history=[] }
    fun execute(self,cmd) {
        push(self.history,{"action":cmd["action"],"data":cmd["data"],"prev":self.text})
        if cmd["action"]=="append" { self.text+=cmd["data"] }
        elif cmd["action"]=="clear" { self.text="" }
    }
    fun undo(self) {
        if len(self.history)==0 { print("Nothing to undo"); return }
        let last=pop(self.history)
        self.text=last["prev"]
        print("Undone:",last["action"])
    }
}
let ed=new TextEditor()
ed.execute({"action":"append","data":"Hello"})
ed.execute({"action":"append","data":" World"})
print(ed.text)
ed.undo()
print(ed.text)
