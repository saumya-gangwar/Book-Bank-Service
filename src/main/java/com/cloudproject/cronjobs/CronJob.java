package com.cloudproject.cronjobs;

import java.util.logging.Logger;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.cloudproject.util.EmailUtil;


public class CronJob implements Job {
	private static final Logger log = Logger.getLogger(CronJob.class.getName());
	private String recipientId, fileName;
	
	public void setRecipientIt (String recipientId) {
		this.recipientId = recipientId;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public CronJob() {
	}
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		log.info("Inside Cron Job..");
		EmailUtil.sendEmail(recipientId, fileName);	
	}
}
