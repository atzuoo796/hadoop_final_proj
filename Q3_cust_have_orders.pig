/*For question #3: Find how many customers have made purchase.
1. run the below command line:
$pig -x local Q3_cust_have_orders.pig
*/

-- Step 1. Load the customer file with pipe delimitor; then load Transactions file:
orders = LOAD '/home/cloudera/term_proj/Transactions' AS (CID:int, OID:int, ODate:chararray, OPrice:float);

-- Step 2. group the orders, extract only CID and get the unique CIDs out of it:
cust_ord_grp = foreach (GROUP orders all) {
uniq_cid = DISTINCT orders.CID;
generate COUNT(uniq_cid) as cnt;
};

-- Display the result: should be 8
dump cust_order_grp;



