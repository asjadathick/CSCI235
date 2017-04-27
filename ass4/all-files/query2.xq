for $t in distinct-values(//journal/title)
return
<journals>
	{$t}
	{for $j in //journal[title=$t]
	return
	<journal>
		{$j/volume}
		{$j/issue}
	</journal>
	}
</journals>