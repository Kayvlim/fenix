package net.sourceforge.fenixedu.presentationTier.gwt.manager.UIPlayground.helloFenix.server;

import java.util.HashMap;
import java.util.Map;

import com.google.gwt.user.client.rpc.IncompatibleRemoteServiceException;
import com.google.gwt.user.client.rpc.SerializationException;
import com.google.gwt.user.server.rpc.RPC;
import com.google.gwt.user.server.rpc.RPCRequest;
import com.google.gwt.user.server.rpc.RemoteServiceServlet;

import net.sourceforge.fenixedu.presentationTier.gwt.manager.UIPlayground.helloFenix.client.GreetingsService;

@SuppressWarnings("serial")
public class GreetingsServiceImpl extends RemoteServiceServlet implements GreetingsService{

    @Override
    public String getGreetings() {
	String result = greetings.get(iter);
	iter = (iter+1)%3;
	return result;
    }
    
    private static Map<Integer,String> greetings = new HashMap<Integer,String>();
    private static int iter = 0;
    
    static {
	greetings.put(0,"Olá Luis. :)");
	greetings.put(1,"Manda um abraço meu ao Paulo. :P");
	greetings.put(2,"Vá, vá, não te comeces já a babar... Calma rapazão! :D");
    }

}
