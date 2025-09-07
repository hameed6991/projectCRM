<script>
function checkNum(eveval){
	if (eveval<48 || eveval>57){
		event.keyCode=0;
		return false;
	}
}
function checkNumDot(eveval){
	if ((eveval<46 || eveval>57) && (eveval!=46) ){
		event.keyCode=0;
		return false;
	}
}
</script>