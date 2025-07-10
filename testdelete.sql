CREATE TABLE IF NOT EXISTS t1 (
    time int,
    fr int
);

CREATE TABLE IF NOT EXISTS t2 (
    time int,
    reltime int
);

INSERT into t1 values (1,20);
INSERT into t1 values (4,40);
INSERT into t1 values (9,20);


insert into t2 values (1,100);
insert into t2 values (1,102);
insert into t2 values (1,104);
insert into t2 values (4,400);
insert into t2 values (4,406);
insert into t2 values (8,800);
insert into t2 values (9,900);
insert into t2 values (9,907);
insert into t2 values (9,909);

SELECT t1.time, t1.fr, t2.reltime
FROM t1
JOIN t2 ON t1.time = t2.time
GROUP BY t1.time;