for $j in distinct-values(//bookshop/product/@ID)
return
<product>
	{$j}
        <count>{count(//book[@IDREF=$j]) +  count(//journal[@IDREF=$j]) + count(//musicCD[@IDREF=$j])}</count>
</product>