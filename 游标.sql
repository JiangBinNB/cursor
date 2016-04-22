

alter table r_product add virtualNumber number ;
comment on column r_product.virtualNumber
  is '虚拟数量';
  
    
--游标    
declare
    v_pid r_product.pid%type;
cursor cursor_sal is  
     select pid from r_product ;  
     
begin  
     open cursor_sal ;  
     loop  
    fetch cursor_sal into v_pid;  
    exit when cursor_sal%notfound;  
    update r_product set virtualNumber=(select trunc(100+100*dbms_random.value) from dual) where pid=v_pid;  
    end loop;  
    close cursor_sal;  
    end;      

--创建存储过程
create or replace procedure virtualNumberUpdate is
begin
declare
    v_pid r_product.pid%type;
cursor cursor_sal is  
     select pid from r_product where virtualNumber is null;  
     
begin  
     open cursor_sal ;  
     loop  
    fetch cursor_sal into v_pid;  
    exit when cursor_sal%notfound;  
    update r_product set virtualNumber=(select trunc(50+50*dbms_random.value) from dual) where pid=v_pid;  
    end loop;  
    close cursor_sal;  
    end;      
end virtualNumberUpdate;
--删除存储过程    
drop procedure virtualNumberUpdate


--用游标插入6000000条数据
declare 
i NUMBER;
begin
for i in 1..6000000 loop
insert into T_GIFTBOOKCARD2 (ID, CARD_NO, BATCH_NUMBER_ID, POST_DATE, GIFTBOOK_ID, GIFTBOOK_NAME, STATE, SETTLE_STATE, CARD_PASSWORD, BATCH_NUMBER, CREATOR, MODIFYER, MODIFY_TIME, ISDELL, CARD_TYPE, IS_VALID, FC_DATE, JH_DATE, CNAME, JH, DQ_DATE, JIEBANG_DATE, BD_DATE, PRODUCT_ATTR, HEALTH_ADVISOR, MEMBER_ACCOUNT)
values (i, CONCAT('20160415',(select trunc(10000+100*dbms_random.value) from dual)), 10029, '2015-04-28 20:54:16', null, null, '0', '0', (select trunc(10000+100*dbms_random.value) from dual), '20160415', null, null, null, '0', 1, 0, null, null, null, null, null, null, null, 0, null, null);  
end LOOP;
END;

select id from T_GIFTBOOKCARD2


 -- Create table
create table T_GIFTBOOKCARD2
(
  id              NUMBER not null,
  card_no         VARCHAR2(2000),
  batch_number_id NUMBER,
  post_date       VARCHAR2(2000),
  giftbook_id     NUMBER,
  giftbook_name   VARCHAR2(2000),
  state           VARCHAR2(2000) default 0,
  settle_state    VARCHAR2(2000) default 0,
  card_password   VARCHAR2(2000),
  batch_number    VARCHAR2(2000),
  creator         VARCHAR2(2000),
  modifyer        VARCHAR2(2000),
  modify_time     VARCHAR2(2000),
  isdell          VARCHAR2(2000) default 0,
  card_type       NUMBER default 1,
  is_valid        NUMBER default 0 not null,
  fc_date         VARCHAR2(2000),
  jh_date         VARCHAR2(2000),
  cname           VARCHAR2(2000),
  jh              VARCHAR2(2000),
  dq_date         VARCHAR2(2000),
  jiebang_date    VARCHAR2(2000),
  bd_date         VARCHAR2(2000),
  product_attr    NUMBER default 0,
  health_advisor  VARCHAR2(2000),
  member_account  VARCHAR2(2000),
  primary key (id)
)
