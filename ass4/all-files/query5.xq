for $b in //book
where count($b/authors/author)>=2
return
<book>
	{$b/title}
	{$b/authors}
</book>