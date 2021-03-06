course(complexity, time(monday,9,15), lecturer(david,harel),
       location(feinberg,a)).

course(math, time(monday,9,11), lecturer(nick,gerald),
       location(wineberg,b)).

course(english, time(monday,9,11), lecturer(zed,good),
       location(wineberg,b)).



schedule_conflict(Time, Place, Course1, Course2) :-
    course(Course1,time(A1,B1,C1),_,location(Place,R1)),
    course(Course2,time(A2,B2,C2),_,location(Place,R2)),
    R1=R2, A1=A2,
    Time >= B1, Time =< C1,
    Time >= B2, Time =< C2.
