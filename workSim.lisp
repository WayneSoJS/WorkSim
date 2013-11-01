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

	(set-user-action '(
		("w" "wait" next-day)
		("h" "watch the horizon" next-day)
		("b" "berate a core member of your team" next-day)
		("q" "quit your job" chicken-out)

		)
	)

	(ln)

)

(defun set-user-action(x)

	(let ((n 0))
    (loop
      (when (= n (length x)) (return))

      (setq opt (nth n x))
      (format t "(~A) ~A~%" (nth 0 opt) (nth 1 opt))

      (incf n))
  )

	(ln)

	(setq continue (read-line))

	(let ((n 0))
    (loop
      (when (= n (length x)) (return))

      (setq opt (nth n x))
      (when (string= continue (nth 0 opt)) (apply (nth 2 opt) ()))

      (incf n))
  )

)

(splash-screen)
(intro)
(start)
