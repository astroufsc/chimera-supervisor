use `chimera-robobs`;
DROP TABLE IF EXISTS action_expose;
DROP TABLE IF EXISTS action_flat;
DROP TABLE IF EXISTS action_focus;
DROP TABLE IF EXISTS action_point;
DROP TABLE IF EXISTS action_pv;
DROP TABLE IF EXISTS action;
DROP TABLE IF EXISTS recurrent;
DROP TABLE IF EXISTS observedam;
DROP TABLE IF EXISTS extmonidb;
DROP TABLE IF EXISTS timeddb;
DROP TABLE IF EXISTS program;
DROP TABLE IF EXISTS obsblock;
DROP TABLE IF EXISTS blockpar;
DROP TABLE IF EXISTS observinglog;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS targets;

use `chimera-robobs`;
SELECT concat('DROP TABLE IF EXISTS ', table_name, ';')
FROM information_schema.tables
WHERE table_schema = 'chimera-robobs';

describe projects;

select * from projects;
select * from blockpar;
select * from obsblock;
select * from targets;

select * from action_point;
select * from action_focus;
select * from action_expose;