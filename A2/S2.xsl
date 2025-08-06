<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" version="1.0" encoding="UTF-8"/>
	<xsl:template match="/forecast">
		<html>
			<body>
				<h1>Part 3</h1>
				<h2>
					<!-- Display queryLocation and queryTime here -->
					<xsl:value-of select="@queryLocation" />
          			[<xsl:value-of select="@queryTime" />]
        		</h2>
				<table border="1" style="text-align:center">
					<tr bgcolor="green" >
						<th width="60px" style="color: black;"><b>Date</b></th>
						<th style="color: black;"><b>Mon</b></th>
						<th style="color: black;"><b>Tue</b></th>
						<th style="color: black;"><b>Wed</b></th>
						<th style="color: black;"><b>Thu</b></th>
						<th style="color: black;"><b>Fri</b></th>
						<th style="color: black;"><b>Sat</b></th>
						<th style="color: black;"><b>Sun</b></th>
					</tr>
					
					<xsl:for-each select="//weather">
						<!-- sort by month, then date -->
						<xsl:sort select="month" data-type="number"
							order="descending" />
						<xsl:sort select="day" data-type="number"
							order="descending" />

						<tr>
							<td bgcolor="green" style="color: black;">
								<xsl:value-of select="format-number(date, '00')" />
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="number(month) = 1">Jan</xsl:when>
									<xsl:when test="number(month) = 2">Feb</xsl:when>
									<xsl:when test="number(month) = 3">Mar</xsl:when>
									<xsl:when test="number(month) = 4">Apr</xsl:when>
									<xsl:when test="number(month) = 5">May</xsl:when>
									<axsl:when test="number(month) = 6">Jun</axsl:when>
									<xsl:when test="number(month) = 7">Jul</xsl:when>
									<xsl:when test="number(month) = 8">Aug</xsl:when>
									<xsl:when test="number(month) = 9">Sep</xsl:when>
									<xsl:when test="number(month) = 10">Oct</xsl:when>
									<xsl:when test="number(month) = 11">Nov</xsl:when>
									<xsl:otherwise>Dec</xsl:otherwise>
								</xsl:choose>
							</td>
							<td width="100px">
								<xsl:if test="dayOfWeek='Mon'">
									<xsl:call-template name="datediv" />
								</xsl:if>
							</td>
							<td width="100px">
								<xsl:if test="dayOfWeek='Tue'">
									<xsl:call-template name="datediv" />
								</xsl:if>
							</td>
							<td width="100px">
								<xsl:if test="dayOfWeek='Wed'">
									<xsl:call-template name="datediv" />
								</xsl:if>
							</td>
							<td width="100px">
								<xsl:if test="dayOfWeek='Thu'">
									<xsl:call-template name="datediv" />
								</xsl:if>
							</td>
							<td width="100px">
								<xsl:if test="dayOfWeek='Fri'">
									<xsl:call-template name="datediv" />
								</xsl:if>
							</td>
							<td width="100px">
								<xsl:if test="dayOfWeek='Sat'">
									<xsl:call-template name="datediv" />
								</xsl:if>
							</td>
							<td width="100px">
								<xsl:if test="dayOfWeek='Sun'">
									<xsl:call-template name="datediv" />
								</xsl:if>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="datediv">
		<div>
			<xsl:variable name="highest_temp" select="highest" />
			<xsl:variable name="lowest_temp" select="lowest" />
			<xsl:for-each select=".">
				<xsl:sort select="number($highest_temp)" data-type="number" order="descending" />
				<xsl:value-of select="$lowest_temp"/>°-<xsl:value-of select="$highest_temp"/>°
			</xsl:for-each>
		</div>

		<div>
		<img>
			<xsl:attribute name="src">
				<xsl:value-of select="overallCode" />
				<xsl:text>.png</xsl:text>
			</xsl:attribute>
		</img>
		</div>
		
		<div>
			<xsl:choose>
				<xsl:when test="overallCode = 'cloudy' or (overallCode = 'rain')" >
					<span style="color: blue"><xsl:value-of select="overall" /></span>
				</xsl:when>
				<xsl:when test="(overallCode = 'thunderstorm')">
					<span style="color: green"><xsl:value-of select="overall" /></span>
				</xsl:when>
				<xsl:when test="(overallCode = 'sunny')">
					<span style="color: red"><xsl:value-of select="overall" /></span>
				</xsl:when>
				<xsl:when test="(overallCode = 'partlySunny')">
					<span style="color: orange"><xsl:value-of select="overall" /></span>
					</xsl:when>
			</xsl:choose>
		</div>
	</xsl:template>
</xsl:stylesheet>