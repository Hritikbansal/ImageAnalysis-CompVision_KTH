house=godthem256;
tools=few256;

subplot(1,2,1);
overlaycurves(house,extractedge(house,1.0,15,'same'));
title("Best Result for House: Scale 1 Threshold 15");

subplot(1,2,2);
overlaycurves(tools,extractedge(tools,1.0,10,'same'));
title("Best result for Tools: Scale 1 Threshold 10");

