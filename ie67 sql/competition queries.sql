use competition;

-- Simple
-- Get all from user
select * from user;

-- Aggregate
-- Get the count of all users in each gender
select gender, COUNT(*) as count
from user
group by gender;

-- Inner/Outer Join
-- Get the count of the number of fans of sport
select name, COUNT(*) as number_of_fans
from sport s
right outer join spectator_follows sf
on s.sportID = sf.sport
group by name
order by number_of_fans;

-- Nested
-- Get the name and hours of each venue used in Championship 1
select name, hours
from venue
where venueID in (
    select venueID
    from match_gen
    where tournamentID in (
        select tournamentID
        from tournament
        where name = 'Championship 1'
    )
);

-- Correlated
-- Get all matches with a total score over the average total score
select matchID, time, scoreAlpha + scoreBeta as TotalScore
from match_gen
where scoreAlpha + scoreAlpha > (
    select avg(scoreAlpha + scoreBeta)
    from match_gen
);

-- >=ALL/>ANY/Exists/Not Exists
-- Get the user(s) with the highest age
select name, age
from user
where age >= ALL (
    select age
    from user
);

-- Union
-- Get all players that once scored 0 points as player Alpha or Beta
select u.name as "Scored Zero Points"
from user u
join player p on u.userID = p.playerID
where p.playerID in (
    select playerAlpha
    from individuals_match
    where matchID in (
        select matchID
        from match_gen
        where scoreAlpha = 0
    )
)
union
select u.name as "Scored Zero Points"
from user u
join player p on u.userID = p.playerID
where p.playerID in (
    select playerBeta
    from individuals_match
    where matchID in (
        select matchID
        from match_gen
        where scoreBeta = 0
    )
);

-- Sub-queries (Select, From)
-- Get names, number of players, and # of matches played of all teams
select t.name,
       (select count(tp.playerID) from team_player tp where tp.teamID = t.teamID group by t.teamID) as 'Num Players',
       (select count(*) from teams_match tm where tm.teamBeta = t.teamID or tm.teamAlpha = t.teamID) as 'Matches Played'
from team t;


-- Extra
-- Competition users
select * from user;

-- Competition spectator
select * from spectator;

-- Competition spectator follows
select * from spectator_follows;

-- Competition sport
select * from sport;

-- Competition player
select * from player;
