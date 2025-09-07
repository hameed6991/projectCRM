<script language = "vbscript" runat = "server" >
function ShowGraphHeaderFormat(GraphType,XAxis,YAxis,CaptionName,SubCaptionName)
	if GraphType = "Column2D" then
	  	ShowGraphHeaderFormat= "<chart bgcolor ='#f5f5f5' palette='2' caption='" & CaptionName & "' useRoundEdges='1' xAxisName='" & XAxis & "' yAxisName='" & YAxis & "' showValues='1' showNames='1' decimals='0' formatNumberScale='0' subcaption='" & SubCaptionName & "'> "
	elseif GraphType = "Pie3D" then
	  	ShowGraphHeaderFormat= "<chart bgcolor ='#f5f5f5' caption='" & CaptionName & "' palette='4' decimals='0' enableSmartLabels='1' enableRotation='0' bgAlpha='40,100' bgRatio='0,100' bgAngle='360' showBorder='1' startingAngle='70' > "
	elseif GraphType = "Line" then
	  	ShowGraphHeaderFormat= "<chart bgcolor ='#f5f5f5' caption='" & CaptionName & "' subcaption='" & SubCaptionName & "' xAxisName='" & XAxis & "' yAxisName= '" & YAxis & "' yAxisMinValue='15000' numberPrefix='' showValues='0' alternateHGridColor= 'FCB541' alternateHGridAlpha= '20' divLineColor= 'FCB541' divLineAlpha= '50' canvasBorderColor= '666666' baseFontColor= '666666' lineColor='FCB541'> "
	elseif GraphType = "Bar2D" then
	  	ShowGraphHeaderFormat= "<chart bgcolor ='#f5f5f5' caption='" & CaptionName & "' xAxisName='" & XAxis & "' yAxisName='" & YAxis & "' showValues='0' decimals='0' formatNumberScale='0' chartRightMargin='30' subcaption='" & SubCaptionName & "'>"
	elseif GraphType = "Area2D" then
	  	ShowGraphHeaderFormat= "<chart bgcolor ='#f5f5f5' palette='2' caption='" & CaptionName & "' subcaption='" & SubCaptionName &"' xAxisName='" & XAxis & "' yAxisMinValue='15000' yAxisName='" & YAxis & "' numberPrefix='' showValues='0'> "
	elseif GraphType = "Doughnut3D" then
	  	ShowGraphHeaderFormat= "<chart bgcolor ='#f5f5f5' palette='2' caption='" & CaptionName & "' xAxisName='" & XAxis & "' yAxisMinValue='15000' yAxisName='" & YAxis & "' numberPrefix='' showValues='0' showBorder='1'> "
	elseif GraphType = "StackedColumn2D" then
	  	ShowGraphHeaderFormat= "<chart bgcolor ='#f5f5f5' palette='2' caption='" & CaptionName & "' xAxisName='" & XAxis & "' yAxisMinValue='15000' yAxisName='" & YAxis & "' numberPrefix='' showValues='0' showBorder='1' useRoundEdges='1' shownames='1' showvalues='1' showSum='1' decimals='0' > "
	elseif GraphType = "StackedArea2D" then
		ShowGraphHeaderFormat= "<chart bgColor='E9E9E9' outCnvBaseFontColor='666666' caption='" & CaptionName & "' xAxisName='" & XAxis & "' YAxisName='" & YAxis & "' numberPrefix='' showValues='1' numVDivLines='10' showAlternateVGridColor='1' AlternateVGridColor='e1f5ff' divLineColor='e1f5ff' vdivLineColor='e1f5ff' baseFontColor='666666' toolTipBgColor='F3F3F3' toolTipBorderColor='666666' canvasBorderColor='666666' canvasBorderThickness='1' showPlotBorder='1' plotFillAlpha='80'> "
	elseif GraphType = "StackedBar2D" then
		ShowGraphHeaderFormat= "<chart palette='2' caption='" & CaptionName & "' shownames='1' showvalues='1' numberPrefix='' showSum='1' decimals='0' useRoundEdges='1'>"
	elseif GraphType = "MSCombiDY2D" then
		ShowGraphHeaderFormat= "<chart palette='2' caption='" & CaptionName & "' subCaption='" & SubCaptionName & "' showValues='1' divLineDecimalPrecision='0' limitsDecimalPrecision='0' PYAxisName='" & XAxis & "' SYAxisName='" & YAxis & "' numberPrefix='' formatNumberScale='0'>"
	else
	  	ShowGraphHeaderFormat = ""
	end if
end function 



function ShowGraphFooterFormat(GraphType)
	if GraphType = "Column2D" then
		  ShowGraphFooterFormat= "</chart> "
	elseif GraphType = "Pie3D" then
		  ShowGraphFooterFormat= "</chart> "
	elseif GraphType = "Line" then
		  ShowGraphFooterFormat= "<styles><definition>  <style name='Anim1' type='animation' param='_xscale' start='0' duration='1' />   <style name='Anim2' type='animation' param='_alpha' start='0' duration='0.6' />   <style name='DataShadow' type='Shadow' alpha='40' />   </definition><application>  <apply toObject='DIVLINES' styles='Anim1' />   <apply toObject='HGRID' styles='Anim2' />   <apply toObject='DATALABELS' styles='DataShadow,Anim2' />   </application>  </styles>  </chart>"
	elseif GraphType = "Bar2D" then
		  ShowGraphFooterFormat= "</chart> "
	elseif GraphType = "Area2D" then
	  	ShowGraphFooterFormat= "<styles><definition>  <style name='Anim1' type='animation' param='_xscale' start='0' duration='1' />   <style name='Anim2' type='animation' param='_alpha' start='0' duration='1' />   <style name='DataShadow' type='Shadow' alpha='20' />   </definition><application>  <apply toObject='DIVLINES' styles='Anim1' />   <apply toObject='HGRID' styles='Anim2' />   <apply toObject='DATALABELS' styles='DataShadow,Anim2' />   </application>  </styles>  </chart>"
	elseif GraphType = "Doughnut3D" then
		  ShowGraphFooterFormat= "</chart> "
	elseif GraphType = "StackedColumn2D" then
		  ShowGraphFooterFormat= "</chart> "
	elseif GraphType = "StackedArea2D" then
		  ShowGraphFooterFormat= "<trendlines><line startValue='22000' endValue='58000' color='999999' displayValue='Target' dashed='1' thickness='2' dashGap='6' alpha='100' showOnTop='1' /></trendlines><styles><definition><style type='animation' name='TrendAnim' param='_alpha' duration='1' start='0' /></definition><application><apply toObject='TRENDLINES' styles='TrendAnim' /></application></styles></chart>"
	elseif GraphType = "StackedBar2D" then
		  ShowGraphFooterFormat= "</chart> "
	elseif GraphType = "MSCombiDY2D" then
		  ShowGraphFooterFormat= "</chart> "
	else
	  	ShowGraphFooterFormat = ""
	end if
end function 

function ShowGraphName(GraphType)
	ShowGraphName = GraphType & ".swf"
end function


</script>