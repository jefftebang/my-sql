IN - OR
<columnName> IN (value1, value2);
role_id IN (3, 2);

role_id = 3 OR role_id = 2;

ANY, ALL (= != > < >= <=)
<columnName> = ANY (value1, value2);
role_id = ANY (3, 2);
role_id = 3 OR role_id = 2;

<columnName> = ALL (value1, value2);
role_id = ALL(3, 2);
role_id = 3 AND role_id = 2;