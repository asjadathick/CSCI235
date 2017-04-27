
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     10.1
   Title:          How to use XPath query language ?
   Script name:    xload.sql
   Task:           To load XML document into XML table
   Created by:     Janusz R. Getta
   Created on:	   04 Apr 2013
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET TERMOUT OFF
CREATE OR REPLACE DIRECTORY mydir as '&1';
INSERT INTO XML VALUES( 
       xmltype(bfilename(UPPER('mydir'),UPPER('&2')),
           nls_charset_id('AL32UTF8')));
DROP DIRECTORY mydir;
SET VERIFY ON
SET FEEDBACK ON
SET TERMOUT ON
SET ECHO ON
prompt Done.
