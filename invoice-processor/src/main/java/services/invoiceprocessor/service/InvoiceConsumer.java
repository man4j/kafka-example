package services.invoiceprocessor.service;

import java.io.IOException;
import java.util.function.Consumer;

import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import services.invoiceprocessor.model.Invoice;

@Service
public class InvoiceConsumer {
    private static final Logger logger = LoggerFactory.getLogger(InvoiceConsumer.class);
    
    private volatile Consumer<Invoice> listener;
    
    @Autowired
    private InvoiceCounter invoiceCounter;
    
    public void addListener(Consumer<Invoice> listener) {
        this.listener = listener;
    }
    
    @KafkaListener(topics = "invoices")
    public void listen(ConsumerRecord<String, String> record) throws JsonParseException, JsonMappingException, IOException, InterruptedException {        
        Thread.sleep(1_000);
        
        invoiceCounter.increment();

        if (listener != null) {
            listener.accept(new ObjectMapper().readValue(record.value(), Invoice.class));
        }
                
        logger.info("Invoice received from: " + record.key());
    }
}

