package com.adapter.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.adapter.services.IJsonService;
import com.common.dto.ReservationDTO;
import com.common.entity.Response;

@RestController
@RequestMapping("adapter-json-controller")
public class AdapterJsonController {

	@Autowired
	private IJsonService iJsonService;

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@PostMapping("/post-json-reservation")
	public ResponseEntity<Response> postJsonReservation(@RequestBody ReservationDTO reservationDTO) {
		Response response = iJsonService.doJsonReservation(reservationDTO);
		logger.info("*** Response to Adapter *** : {}", response);
		return ResponseEntity.status(HttpStatus.OK).body(response);

	}

}
