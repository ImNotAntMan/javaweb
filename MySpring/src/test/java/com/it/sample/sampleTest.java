package com.it.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB_INF/sprint/root-context.xml")
@Log4j
public class sampleTest {
	
	@Test
	public void testSample() {
		log.info("test...............................");
	}
}
