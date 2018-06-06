create table json_example_2(
id number,
data_json clob,
CONSTRAINT data_constr check(data_json is json)
);

insert into json_example_2 values
(1, 
'{
   rgb_colors: 
   [
      {
        color: "red",
        value: "#f00"
      },
      {
        color: "green",
        value: "#0f0"
      },
      {
        color: "blue",
        value: "#00f"
      },
      {
        color: "cyan",
        value: "#0ff"
      },
      {
        color: "magenta",
        value: "#f0f"
      },
      {
        color: "yellow",
        value: "#ff0"
      },
      {
        color: "black",
        value: "#000"
	    }
   ]
}');
delete from json_example_2;

select je.data_json from json_example_2 je;

create table json_to_table as select jt.color,jt.value
                              from json_example_2 je, json_table(je.data_json, '$.rgb_colors[*]'
                                   COLUMNS(COLOR PATH '$.color',
                                           VALUE PATH '$.value'
                                          )) jt
                              where je.id=1;


select * from json_to_table;




