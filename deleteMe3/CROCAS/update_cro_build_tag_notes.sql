--- This script rolls back an updated build_tag_id for a crocas client
--
--
-- START update_cro_build_tag.sql <client div id>, <previous build tag to update to>, <newer build tag to update from>
-- sample:
--  START update_cro_build_tag.sql 123, 52, 53

-- Update the crocas build tag in client_div
update client_div set crocas_build_tag_id=&2 where id=&1 and crocas_build_tag_id=&3;
commit;

-- update any budget created or updated to newer build tag, back to previous build tag
update cro_budget set build_tag_id=&2 where build_tag_id=&3 and cro_trial_id in (select trial_id from cro_trial,trial where cro_trial.trial_id=trial.id and trial.client_div_id=&1);
commit;


1=354 2=48 3=52

select id, name, CLIENT_DIV_IDENTIFIER, BUILD_TAG_ID, TSPD_BUILD_TAG_ID, CROCAS_BUILD_TAG_ID from client_div where id=354 OR id=356;

select * from BUILD_TAG_TO_CLIENT_DIV where CLIENT_DIV_ID=354 or client_div_id=356;

commit;

update BUILD_TAG_TO_CLIENT_DIV set released_date='10-FEB-14',released=1 where id=11164 or id=11163;

select id, name, CROCAS_BUILD_TAG_ID from client_div where id=354 OR id=356;

select * from BUILD_TAG_TO_CLIENT_DIV where CLIENT_DIV_ID=354 or client_div_id=356;

update client_div set CROCAS_BUILD_TAG_ID=52 where ID=354;
commit;


update BUILD_TAG_TO_CLIENT_DIV set released_date='30-SEP-14' where id=11160;
rollback;

START update_cro_build_tag.sql 354, 48, 52;

select id,name,build_tag_id from cro_budget where cro_trial_id in (select trial_id from cro_trial,trial where cro_trial.trial_id=trial.id and trial.client_div_id=354);




select id,short_desc,build_tag_id , cro_trial_id from cro_budget where cro_trial_id in (select trial_id from cro_trial,trial where cro_trial.trial_id=trial.id and trial.client_div_id=354);

select id, name, tspd_build_tag_id, build_tag_id, CROCAS_BUILD_TAG_ID from client_div where id=354 OR id=356;

select * from BUILD_TAG_TO_CLIENT_DIV where CLIENT_DIV_ID=354 or client_div_id=356;

select * from working_trial where trial_id = 43318;

update client_div set CROCAS_BUILD_TAG_ID=52 where ID=354;
commit;

update client_div set crocas_build_tag_id=48 where id=354 and crocas_build_tag_id=52;
update cro_budget set build_tag_id=48 where build_tag_id=52 and cro_trial_id in (select trial_id from cro_trial,trial where cro_trial.trial_id=trial.id and trial.client_div_id=354);
commit;

update client_div set crocas_build_tag_id=52 where id=354 and crocas_build_tag_id=48;
update cro_budget set build_tag_id=52 where build_tag_id=48 and cro_trial_id in (select trial_id from cro_trial,trial where cro_trial.trial_id=trial.id and trial.client_div_id=354);
commit;


