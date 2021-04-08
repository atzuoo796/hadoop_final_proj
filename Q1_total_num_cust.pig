/*Use Distinct operator to eliminate the dups:*/
/*Instruction:
1. Under cloudera home dir, /home/cloudera, create 'term_proj':
$mkdir term_proj 

Then change dir to it:
$cd term_proj

2. save Customer and cust_no_dups.pig files under the current dir using SFTP or Filezilla.

3. run the below command line:
$pig -x local Q1_total_num_cust.pig
 
*/

-- Step 1. Load the customer file with pipe delimiter:
cust = LOAD '/home/cloudera/term_proj/Customer' USING PigStorage('|') AS (CID:int, Name:chararray, Email:chararray);

-- Step 2. Get the distinct ones and group them:
cust_grp = group cust all;

-- count the total:
cust_cnt = foreach cust_grp generate COUNT(cust.CID);

dump cust_cnt;
