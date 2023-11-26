<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xalan/java" exclude-result-prefixes="java" version="2.0">
	<xsl:output method="xml" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="UserName" />
	<xsl:param name="Password" />
	<xsl:param name="HotelId" />
	<xsl:param name="ResID" />

	<xsl:template match="Reservation">
		<Reservation>
			<xsl:attribute name="xmlns">http://www.opentravel.org/OTA/2003/05</xsl:attribute>
			<xsl:attribute name="UserName"><xsl:value-of select="$UserName" /></xsl:attribute>
			<xsl:attribute name="Password"><xsl:value-of select="$Password" /></xsl:attribute>
			<xsl:attribute name="HotelCode"><xsl:value-of select="$HotelId" /></xsl:attribute>
			<xsl:attribute name="Version"><xsl:value-of select="//@Version" /></xsl:attribute>
			<xsl:attribute name="CommonCode"><xsl:value-of select="//@CommonCode" /></xsl:attribute>
			<TravelAgent>
				<xsl:element name="Agent">
					<xsl:attribute name="agentId"><xsl:value-of select="/Reservation/TravelAgent/Agent/@agentId" /></xsl:attribute>
					<xsl:element name="Name">
           				<xsl:value-of select="/Reservation/TravelAgent/Agent/Name/text()"/>
           			</xsl:element>
					<xsl:element name="City">
           				<xsl:value-of select="/Reservation/TravelAgent/Agent/City/text()"/>
           			</xsl:element>
					<xsl:element name="Gender">
           				<xsl:value-of select="/Reservation/TravelAgent/Agent/Gender/text()"/>
           			</xsl:element>
					<xsl:element name="RegionOfOperation">
           				<xsl:value-of select="/Reservation/TravelAgent/Agent/RegionOfOperation/text()"/>
           			</xsl:element>
					<xsl:element name="MobileNumber">
           				<xsl:value-of select="/Reservation/TravelAgent/Agent/MobileNumber/text()"/>
           			</xsl:element>
					<xsl:element name="ChannelPartnerOTA">
           				<xsl:value-of select="/Reservation/TravelAgent/Agent/ChannelPartnerOTA/text()"/>
           			</xsl:element>
					<xsl:element name="Description">
           				<xsl:value-of select="/Reservation/TravelAgent/Agent/Description/text()"/>
           			</xsl:element>
				</xsl:element>
			</TravelAgent>
			
			<ReservationDetails>
				<xsl:element name="ReservationId">
           				<xsl:value-of select="/Reservation/ReservationDetails/ReservationId/text()"/>
           		</xsl:element>
				<xsl:element name="UniqueId">
           				<xsl:value-of select="/Reservation/ReservationDetails/UniqueId/text()"/>
           		</xsl:element>
				<xsl:element name="BookingCreatedTime">
           				<xsl:value-of select="/Reservation/ReservationDetails/BookingCreatedTime/text()"/>
           		</xsl:element>
				<xsl:element name="ArrivalDate">
           				<xsl:value-of select="/Reservation/ReservationDetails/ArrivalDate/text()"/>
           		</xsl:element>
				<xsl:element name="DepartureDate">
           				<xsl:value-of select="/Reservation/ReservationDetails/DepartureDate/text()"/>
           		</xsl:element>
				<xsl:element name="NumberOfStayDays">
           				<xsl:value-of select="/Reservation/ReservationDetails/NumberOfStayDays/text()"/>
           		</xsl:element>
				<xsl:element name="ReservationStatus">
           				<xsl:value-of select="/Reservation/ReservationDetails/ReservationStatus/text()"/>
           		</xsl:element>
				
				<HotelDetails>
					<xsl:element name="HotelId">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/HotelId/text()"/>
					</xsl:element>
					<xsl:element name="HotelName">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/HotelName/text()"/>
					</xsl:element>
					<xsl:element name="HotelCityName">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/HotelCityName/text()"/>
					</xsl:element>
					<xsl:element name="HotelCityPostalCode">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/HotelCityPostalCode/text()"/>
					</xsl:element>
					
					<RoomDetails>
						<xsl:element name="RoomId">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/RoomDetails/RoomId/text()"/>
						</xsl:element>
						<xsl:element name="RoomName">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/RoomDetails/RoomName/text()"/>
						</xsl:element>
						<xsl:element name="RateId">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/RoomDetails/RateId/text()"/>
						</xsl:element>
						<xsl:element name="RateName">
           				<xsl:value-of select="/Reservation/ReservationDetails/HotelDetails/RoomDetails/RateName/text()"/>
						</xsl:element>
					</RoomDetails>
				</HotelDetails>
				
				<GuestDetails>
multiple					<GuestDetail>
						<xsl:element name="GuestId">
							<xsl:value-of select="/Reservation/ReservationDetails/GuestDetails/GuestDetail/GuestId/text()"/>
						</xsl:element>
						<xsl:element name="PrimaryGuestFirstName">
							<xsl:value-of select="/Reservation/ReservationDetails/GuestDetails/GuestDetail/PrimaryGuestFirstName/text()"/>
						</xsl:element>
						<xsl:element name="PrimaryGuestLastName">
							<xsl:value-of select="/Reservation/ReservationDetails/GuestDetails/GuestDetail/PrimaryGuestLastName/text()"/>
						</xsl:element>
						
						<PrimaryGuestMobileNumbers>
multiple							<xsl:element name="PrimaryGuestMobileNumber">
								<xsl:value-of select="/Reservation/ReservationDetails/GuestDetails/GuestDetail/PrimaryGuestMobileNumbers/PrimaryGuestMobileNumber/text()"/>
							</xsl:element>
						</PrimaryGuestMobileNumbers>
						
						
						<SecondaryGuestNames>
multiple					<xsl:element name="SecondaryGuestName">
								<xsl:value-of select="/Reservation/ReservationDetails/GuestDetails/GuestDetail/SecondaryGuestNames/SecondaryGuestName/text()"/>
							</xsl:element>								
						</SecondaryGuestNames>
						
						<SecondaryGuestMobileNumbers>
multiple					<xsl:element name="SecondaryGuestName">
								<xsl:value-of select="/Reservation/ReservationDetails/GuestDetails/GuestDetail/SecondaryGuestMobileNumbers/SecondaryGuestMobileNumber/text()"/>
							</xsl:element>								
						</SecondaryGuestMobileNumbers>
					</GuestDetail>
				</GuestDetails>
				
				<AmountDetails>
					<xsl:element name="TotalAmount">
							<xsl:value-of select="/Reservation/ReservationDetails/AmountDetails/TotalAmount/text()"/>
					</xsl:element>
					<xsl:element name="ChargesPerDay">
							<xsl:value-of select="/Reservation/ReservationDetails/AmountDetails/ChargesPerDay/text()"/>
					</xsl:element>
					<xsl:element name="ChargesPerPerson">
							<xsl:value-of select="/Reservation/ReservationDetails/AmountDetails/ChargesPerPerson/text()"/>
					</xsl:element>
					<xsl:element name="ExtraCharges">
							<xsl:value-of select="/Reservation/ReservationDetails/AmountDetails/ExtraCharges/text()"/>
					</xsl:element>
					<xsl:element name="CurrencyCode">
							<xsl:value-of select="/Reservation/ReservationDetails/AmountDetails/CurrencyCode/text()"/>
					</xsl:element>
				</AmountDetails>
			
			
			</ReservationDetails>
			
		</Reservation>
	</xsl:template>
	
	

</xsl:stylesheet>
