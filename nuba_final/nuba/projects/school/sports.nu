# School: Sports Management
class Sport {
    fun init(self, name, coach, max_players) {
        self.name        = name
        self.coach       = coach
        self.max_players = max_players
        self.team        = []
        self.results     = []
    }
    fun add_player(self, player_id, player_name, position) {
        if len(self.team) >= self.max_players { throw "Team is full for: " + self.name }
        push(self.team, {"id":player_id,"name":player_name,"position":position})
        return self
    }
    fun record_result(self, opponent, score_us, score_them, date) {
        let won = score_us > score_them
        push(self.results, {
            "opponent":opponent,"us":score_us,"them":score_them,
            "date":date,"won":won
        })
        let result_str = "WON" if won else ("DREW" if score_us==score_them else "LOST")
        print(format("{0} vs {1}: {2}-{3} ({4})", self.name, opponent, score_us, score_them, result_str))
        return self
    }
    fun stats(self) {
        let won  = len(filter(fun(r)->r["won"],  self.results))
        let lost = len(filter(fun(r)->not r["won"] and r["us"]!=r["them"], self.results))
        let drew = len(self.results) - won - lost
        print(format("{0} | Coach: {1} | Players: {2}/{3}",
            self.name, self.coach, len(self.team), self.max_players))
        print(format("Record: {0}W {1}D {2}L", won, drew, lost))
    }
}
let football = new Sport("Football","Coach Rivera",11)
football.add_player("P001","Alice","Forward")
football.add_player("P002","Bob","Midfielder")
football.add_player("P003","Carol","Defender")
football.add_player("P004","Dave","Goalkeeper")
football.record_result("City School",3,1,"2024-01-10")
football.record_result("East Academy",2,2,"2024-01-17")
football.record_result("North High",4,0,"2024-01-24")
football.stats()
