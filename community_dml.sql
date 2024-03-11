SELECT * FROM team3_community.member;


INSERT INTO MEMBER(ME_ID,ME_MS_STATE,ME_PW,ME_EMAIL,ME_NAME,ME_PHONE,ME_AUTHORITY) VALUES("user","이용중","user","user","user","010","USER");

INSERT INTO BOARD(BO_CA_NUM,BO_NAME) VALUES(1,"자유");

INSERT INTO POST(PO_BO_NUM,PO_ME_ID,PO_TITLE,PO_CONTENT,PO_DATE) VALUES(1,"USER","TEST","TEST",NOW());

INSERT INTO COMMENT(CM_PO_NUM,CM_ME_ID,CM_CONTENT) VALUES(1,"USER","TEST");

INSERT INTO FILE(FI_PO_NUM,FI_NAME,FI_ORI_NAME) VALUES(1,"FILETEST","FILETEST");

insert into recommend(rc_po_num,rc_me_id,rc_state) values(1,"user",1);

insert into report_type(rt_name) value("게시글");
insert into report(re_me_id,re_rt_name,re_table,re_content,re_state,re_target) values("user","게시글","도배","너무시끄러움","신고됨",1);


select * from report;

