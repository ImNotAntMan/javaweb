package com.it.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Chef {
	@Setter(onMethod_ = @Autowired)
	private Chef chef;
}
