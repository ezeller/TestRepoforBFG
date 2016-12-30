-- This script rolls back an updated build_tag_id for a crocas client
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