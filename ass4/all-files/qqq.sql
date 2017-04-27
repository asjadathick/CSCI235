DECLARE                                       
result   XMLType;                            
buf      VARCHAR(20000);                     
doc      DBMS_XMLDOM.DOMDocument;            
BEGIN                                        
SELECT XMLQuery(                             
'                                            
for $j in distinct-values(//bookshop/product[comments]/@ID)
return
<book>
	{//book[@IDREF=$j]/title}
</book>' PASSING X RETURNING CONTENT)               
  INTO result                                
  FROM XML;                                  
  doc  := DBMS_XMLDOM.newDOMDocument(result);
  DBMS_XMLDOM.writeToBuffer(doc, buf);       
  DBMS_OUTPUT.put_line(buf);                 
END;                                         
/                                            
