 -- Change concurrenet program Id as required
 SELECT fat.APPLICATION_NAME,
         fctl.user_concurrent_program_name,
         DECODE (TO_RUN_TYPE, 'S', 'Set', 'Program') TYPE,
         DECODE (INCOMPATIBILITY_TYPE, 'G', 'Global', 'Domain')
            "Incompatibilty Type"
    FROM applsys.FND_CONCURRENT_PROGRAM_SERIAL fcrs,
         applsys.FND_CONCURRENT_PROGRAMS_TL fctl,
         applsys.FND_APPLICATION_TL fat
   WHERE     fcrs.RUNNING_APPLICATION_ID = fat.application_id
         AND (RUNNING_CONCURRENT_PROGRAM_ID = 68509) -- CP id of the program in question
         AND fctl.CONCURRENT_PROGRAM_ID = fcrs.TO_RUN_CONCURRENT_PROGRAM_ID
         AND fctl.LANGUAGE = 'US'
         AND fat.LANGUAGE = 'US'
ORDER BY to_run_application_id, to_run_concurrent_program_id;
