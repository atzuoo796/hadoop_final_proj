/*Use Distinct operator to eliminate the dups and empty rows and count unique customers:

Instruction:
1. If not done so, under cloudera home dir, /home/cloudera, create 'term_proj':
$mkdir term_proj 

Then change dir to it:
$cd term_proj

2. save Customer and Q2_total_uniq_cust.pig files under the current dir using SFTP or Filezilla.

3. run the below command line:
$pig -x local Q2_total_uniq_cust.pig
 
*/

-- Step 1. Load the customer file with pipe delimitor:
cust = LOAD '/home/cloudera/term_proj/Customer' USING PigStorage('|') AS (CID:int, Name:chararray, Email:chararray);

-- Step 2. Get the distinct ones:
cust_nodups = DISTINCT cust;

-- Step3. Remove empty rows using FILTER on criteria where CID is not null:
cust_nodups_noempty = FILTER cust_nodups BY CID IS NOT NULL;
cust_grp = group cust_nodups_noempty all;
cust_nodups_noempty_cnt = foreach cust_grp generate COUNT(cust_nodups_noempty.CID);

-- display the result and should be 13:
dump cust_nodups_noempty_cnt;
