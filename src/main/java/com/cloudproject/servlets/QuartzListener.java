package com.cloudproject.servlets;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.quartz.CronExpression;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import com.cloudproject.cronjobs.CronJob;

/**
 * Application Lifecycle Listener implementation class QuartzListener
 *
 */

@WebListener
public class QuartzListener implements ServletContextListener {
	
	Scheduler scheduler = null;
    public void contextDestroyed(ServletContextEvent sce)  { 
    	 System.out.println("Context Destroyed");
         try
         {
                 scheduler.shutdown();
         }
         catch (SchedulerException e)
         {
                 e.printStackTrace();
         }
    }
	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	System.out.println("Context Initialized");
    	try {
			scheduler = StdSchedulerFactory.getDefaultScheduler();
			JobDetail jobDetail = JobBuilder.newJob(CronJob.class)
					.withIdentity("Job1", "group1")
					.build();
			Trigger trigger = TriggerBuilder.newTrigger()
					.withIdentity("cronTrigger1","group1")
					.forJob(jobDetail)
					.withSchedule(CronScheduleBuilder.cronSchedule(new CronExpression("0 * 0 ? * * *")))
					.build();
			scheduler.start();
			scheduler.scheduleJob(jobDetail, trigger);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
    }
	
}
