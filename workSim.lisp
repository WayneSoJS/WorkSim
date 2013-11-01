(defun pr(x)
	(format t (concatenate 'string x "~%"))
)

(defun ln()
	(pr "")
)


(defun splash-screen()
	(ln)
	(ln)
	(pr "Welcome to Work Simulator")
	(pr "An exciting text-based workplace simulation!~%")
	(ln)
)

(defun intro()
	(pr "The year is 2010. You have been offered a job at an established, but up-and-coming, global technology company.")
	(pr "The pay is good and morale in the workforce is buoyant...")
	(ln)
)

(defun start()
	(pr "Are you up for it? (yes/no)")
	(setq go (read-line))
	(if (string= go "yes")
		(begin)
		(if (string= go "no") (chicken-out) (start))
	)
)

(defun chicken-out()
	(ln)
	(pr "OK...")
	(pr "bye!")
	(exit)
)

(defun begin()
	(ln)
	(pr "Your legacy as a rich media advertising lead dev awaits...")	
	(start-loop)
)

(setq location '(
	"It's a new day. Your team are working hard and there is plenty to do."
))

(defun description()
	(pr (first location))
)

(setq water 100)
(setq day 1)
(setq health 100)

(defun start-loop()
	(loop (game-loop))
)

(defun next-day()
	(incf day)
)

(defun game-loop()

	(ln)
	(pr "___________________________________")
	(ln)

	(format t "day : ~A~%" day)
	(description)
	(ln)

	(sleep 1)

	(ln)
	(pr "what would you like to do?")

	(pr "(w) wait")
	(pr "(h) watch the horizon")
	(pr "(b) berate a core member of your team")
	(pr "(q) quit your job")
	(ln)

	(setq continue (read-line))

	(when (string= continue "q") (chicken-out))
	(when (string= continue "b") (next-day))	
	(when (string= continue "w") (next-day))	
	(when (string= continue "h") (next-day))

	; (user-action '(
	; 	("w" "wait" next-day)
	; 	("h" "watch the horizon" next-day)
	; 	("b" "berate a core member of your team" next-day)
	; 	("q" "quit your job" chicken-out)

	; 	)
	; )

	(ln)

)

(defun user-action(x)


	(pr "(w) wait")
	(pr "(h) watch the horizon")
	(pr "(b) berate a core member of your team")
	(pr "(q) quit your job")
	(ln)

	(setq continue (read-line))

	(when (string= continue "q") (chicken-out))
	(when (string= continue "b") (next-day))	
	(when (string= continue "w") (next-day))	
	(when (string= continue "h") (next-day))
)

(splash-screen)
(intro)
(start)
