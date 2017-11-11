public class ScheduleExample implements Schedulable{
    public void execute(SchedulableContext SC){
        SendanEmailAccCount sea = new SendanEmailAccCount();
        sea.getcount();
    }
}