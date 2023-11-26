package com.adapter.services;

import java.time.Duration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException.InternalServerError;
import org.springframework.web.reactive.function.client.WebClient;
import com.common.dto.ReservationDTO;
import com.common.entity.Response;
import reactor.util.retry.Retry;

@Service
public class JsonServiceImpl implements IJsonService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	WebClient webClient = WebClient.create();

	@SuppressWarnings("unchecked")
	@Override
	public Response doJsonReservation(ReservationDTO reservation) {
		Response response;
		try {
			logger.info("Data sending to central-reservation-system : {} ", reservation);
			response = webClient.post().uri("http://localhost:8080/reservation/api/v1/post-reservation")
					.bodyValue(reservation)
					/* .header("HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE") */
					.retrieve().bodyToMono(Response.class).block();
			/*
			 * .retryWhen(Retry.backoff(3, Duration.ofSeconds(2)) .doAfterRetry(signal ->
			 * logger.info("Retry count : {}", signal.totalRetries())))
			 * .filter(InternalServerError.class::isInstance).block();
			 */
			logger.info("response from crs : {} ", response);
			return response;
		} catch (Exception e) {
			logger.info("Error while posting data to crs {} {} ", e.getLocalizedMessage(), reservation);
			return new Response(e.getLocalizedMessage(), 500, e.getMessage(), reservation.getReservationId(),
					reservation.getUniqueId(), reservation.getHotelId(), true, false);
		}
	}
}
