package com.adapter.services;

import com.common.dto.ReservationDTO;
import com.common.entity.Response;

public interface IJsonService {

	public Response doJsonReservation(ReservationDTO Reservation);
	
}
