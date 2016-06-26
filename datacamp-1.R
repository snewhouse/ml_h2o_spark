# kang_nose is pre-loaded in your workspace

# Build model and make plot
lm_kang <- lm(nose_length ~ nose_width, data=kang_nose)
plot(kang_nose, xlab = "nose width", ylab = "nose length")
abline(lm_kang$coefficients, col = "red")

# Apply predict() to lm_kang: nose_length_est
nose_length_est <- predict(lm_kang)

# Calculate difference between the predicted and the true values: res
res <- kang_nose$nose_length - nose_length_est

# Calculate RMSE, assign it to rmse and print it

rmse <- sqrt(mean(res^2))

rmse


# kang_nose, lm_kang and res are already loaded in your workspace

## res <- kang_nose$nose_length - nose_length_est

# Calculate the residual sum of squares: ss_res
ss_res <- sum(res^2)

# Determine the total sum of squares: ss_tot

y_hat <- mean(kang_nose$nose_length)
y_i <- kang_nose$nose_length
ss <- (y_i - y_hat)^2

ss_tot <- sum(ss)

# Calculate R-squared and assign it to r_sq. Also print it.

r_sq <- 1 - (ss_res / ss_tot)

r_sq

# Apply summary() to lm_kang

summary(lm_kang)

# world_bank_train and cgdp_afg is available for you to work with

# Plot urb_pop as function of cgdp
plot(world_bank_train$urb_pop, world_bank_train$cgdpm)

# Set up a linear model between the two variables: lm_wb

lm_wb <- lm(urb_pop ~ cgdp, data=world_bank_train)

# Add a red regression line to your scatter plot
plot(world_bank_train$urb_pop, world_bank_train$cgdpm)
abline(lm_wb$coefficients, col="red")

# Summarize lm_wb and select R-squared
summary(lm_wb)

summary(lm_wb)$r.squared

# Predict the urban population of afghanistan based on cgdp_afg

predict(lm_wb, cgdp_afg)


# Add a plot:  energy/100g as function of total size. Linearity plausible?
plot(energy ~ protein, choco_data)
plot(energy ~ fat, choco_data)
plot(energy ~ size, choco_data)

# Build a linear model for the energy based on all other variables: lm_choco

lm_choco <- lm(energy ~ ., data=choco_data)

# Plot the residuals in function of your fitted observations
plot(lm_choco$fitted.values, lm_choco$residuals)
abline(h=0)

# Make a Q-Q plot of your residual quantiles
qqnorm(lm_choco$residuals)
qqline(lm_choco$residuals)

# Summarize lm_choco
summary(lm_choco)

# world_bank_train, world_bank_test and lm_wb_log are pre-loaded

# Build the log-linear model
lm_wb_log <- lm(urb_pop ~ log(cgdp), data = world_bank_train)

# Calculate rmse_train
rmse_train <- sqrt(mean(lm_wb_log$residuals ^ 2))

# The real percentage of urban population in the test set, the ground truth
world_bank_test_truth <- world_bank_test$urb_pop

# The predictions of the percentage of urban population in the test set
world_bank_test_input <- data.frame(cgdp = world_bank_test$cgdp)
world_bank_test_output <- predict(lm_wb_log, world_bank_test_input)

# The residuals: the difference between the ground truth and the predictions
res_test <- world_bank_test_output - world_bank_test_truth


# Use res_test to calculate rmse_test
rmse_test <- sqrt(mean(res_test ^ 2))

# Print the ratio of the test RMSE over the training RMSE
rmse_test / rmse_train

###
# You don't have to change this!
# The algorithm is already coded for you;
# inspect it and try to understand how it works!
my_knn <- function(x_pred, x, y, k){
    m <- length(x_pred)
    predict_knn <- rep(0, m)
    for (i in 1:m) {

        # Calculate the absolute distance between x_pred[i] and x
        dist <- abs(x_pred[i] - x)

        # Apply order() to dist, sort_index will contain
        # the indices of elements in the dist vector, in
        # ascending order. This means sort_index[1:k] will
        # return the indices of the k-nearest neighbors.
        sort_index <- order(dist)

        # Apply mean() to the responses of the k-nearest neighbors
        predict_knn[i] <- mean(y[sort_index[1:k]])

    }
    return(predict_knn)
}
###

# world_bank_train and world_bank_test are pre-loaded

# Apply your algorithm on the test set: test_output
test_output <- my_knn(x_pred=world_bank_test$cgdp,
                      x=world_bank_train$cgdp,
                      y=world_bank_train$urb_pop,
                      k=30)


# Have a look at the plot of the output
plot(world_bank_train,
     xlab = "GDP per Capita",
     ylab = "Percentage Urban Population")
points(world_bank_test$cgdp, test_output, col = "green")


# world_bank_train and world_bank_test are pre-loaded
# lm_wb and lm_wb_log have been trained on world_bank_train
# The my_knn() function is available

# Define ranks to order the predictor variables in the test set
ranks <- order(world_bank_test$cgdp)

# Scatter plot of test set
plot(world_bank_test,
     xlab = "GDP per Capita", ylab = "Percentage Urban Population")

# Predict with simple linear model and add line
test_output_lm <- predict(lm_wb, data.frame(cgdp = world_bank_test$cgdp))
lines(world_bank_test$cgdp[ranks], test_output_lm[ranks], lwd = 2, col = "blue")

# Predict with log-linear model and add line
test_output_lm_log <- predict(lm_wb_log, data.frame(cgdp = world_bank_test$cgdp))

lines(world_bank_test$cgdp[ranks], test_output_lm_log[ranks], lwd = 2, col = "red")

# Predict with k-NN and add line
test_output_knn <- my_knn(x_pred=world_bank_test$cgdp,
                          x=world_bank_train$cgdp,
                          y=world_bank_train$urb_pop,
                          K=30)


lines(world_bank_test$cgdp[ranks], test_output_knn[ranks], lwd = 2, col = "green")


# Calculate RMSE on the test set for simple linear model
sqrt(mean( (test_output_lm - world_bank_test$urb_pop) ^ 2))

# Calculate RMSE on the test set for log-linear model
sqrt(mean( (test_output_lm_log - world_bank_test$urb_pop) ^ 2))

# Calculate RMSE on the test set for k-NN technique
sqrt(mean( (test_output_knn - world_bank_test$urb_pop) ^ 2))

# seeds and seeds_type are pre-loaded in your workspace

# Set random seed. Don't remove this line.
set.seed(100)

# Do k-means clustering with three clusters, repeat 20 times: seeds_km
seeds_km <- kmeans(seeds,centers=3, nstart=20 )

# Print out seeds_km
seeds_km

# Compare clusters with actual seed types. Set k-means clusters as rows
table(seeds_km$cluster, seeds_type)

# Plot the length as function of width. Color by cluster
plot(seeds$length, seeds$width, col=seeds_km$cluster)

# The dataset school_result is pre-loaded

# Set random seed. Don't remove this line.
set.seed(100)

# Explore the structure of your data
str(school_result)

# Initialise ratio_ss
ratio_ss <- rep(0,7)

# Finish the for-loop.
for (k in 1:7) {

    # Apply k-means to school_result: school_km
    school_km <- kmeans(school_result, centers=k, nstart=20 )

    # Save the ratio between of WSS to TSS in kth element of ratio_ss
    totss <- school_km$tot.withinss / school_km$totss

    ratio_ss[k] <- totss

}

# Make a scree plot with type "b" and xlab "k"
plot(ratio_ss, type="b", xlab="k")



# The dataset run_record has been loaded in your workspace
# The dataset run_record has been loaded in your workspace
# The dataset run_record has been loaded in your workspace

# Set random seed. Don't remove this line.
set.seed(1)

# Explore your data with str() and summary()
str(run_record)
summary(run_record)

# Cluster run_record using k-means: run_km. 5 clusters, repeat 20 times

run_km <- kmeans(run_record, 5, 20)

# Plot the 100m as function of the marathon. Color using clusters
plot(run_record$X100m,
     run_record$marathon,
     col=run_km$cluster)

# Calculate Dunn's index: dunn_km. Print it.

dunn_km <- dunn(clusters=run_km$cluster, Data=run_record)

dunn_km


# The dataset run_record as well as run_km are available

# Set random seed. Don't remove this line.
set.seed(1)

# Standardize run_record, transform to a dataframe: run_record_sc
run_record_sc <- as.data.frame(scale(run_record))

# Cluster run_record_sc using k-means: run_km_sc. 5 groups, let R start over 20 times
run_km_sc <- kmeans(run_record_sc, 5, nstart=20)

# Plot records on 100m as function of the marathon. Color using the clusters in run_km_sc
plot(run_record$marathon,run_record$X100m,
     col=run_km_sc$cluster,
     ylab="100m",
     xlab="marathon")

# Compare the resulting clusters in a nice table
table(run_km$cluster, run_km_sc$cluster)

# Calculate Dunn's index: dunn_km_sc. Print it.
dunn_km_sc <- dunn(clusters=run_km_sc$cluster,Data=run_record_sc)

dunn_km_sc

# The dataset run_record_sc has been loaded in your workspace

# Apply dist() to run_record_sc: run_dist

run_dist <- dist(run_record_sc)

# Apply hclust() to run_dist: run_single
run_single <- hclust(run_dist, method="single")

# Apply cutree() to run_single: memb_single

memb_single <- cutree(run_single, k=5)

# Apply plot() on run_single to draw the dendrogram
plot(run_single)

# Apply rect.hclust() on run_single to draw the boxes
rect.hclust(run_single,k=5, border=2:6)

# run_record_sc is pre-loaded

# Code for single-linkage
run_dist <- dist(run_record_sc, method = "euclidean")
run_single <- hclust(run_dist, method = "single")
memb_single <- cutree(run_single, 5)
plot(run_single)
rect.hclust(run_single, k = 5, border = 2:6)

# Apply hclust() to run_dist: run_complete
run_complete <- hclust(run_dist, method = "complete")

# Apply cutree() to run_complete: memb_complete
memb_complete <- cutree(run_complete, 5)

# Apply plot() on run_complete to draw the dendrogram
plot(run_complete)

# Apply rect.hclust() on run_complete to draw the boxes
rect.hclust(run_complete, k = 5, border = 2:6)

# table() the clusters memb_single and memb_complete. Put memb_single in the rows
table(memb_single, memb_complete)

# run_record_sc, run_km_sc, memb_single and memb_complete are pre-calculated

# Set random seed. Don't remove this line.
set.seed(100)

# Dunn's index for k-means: dunn_km
dunn_km <- dunn(clusters=run_km_sc$cluster , Data=run_record_sc )
dunn_km
# Dunn's index for single-linkage: dunn_single
dunn_single <- dunn(clusters=memb_single , Data=run_record_sc )
dunn_single
# Dunn's index for complete-linkage: dunn_complete
dunn_complete <- dunn(clusters=memb_complete , Data=run_record_sc )
dunn_complete
# Compare k-means with single-linkage
table(run_km_sc$cluster,memb_single)

# Compare k-means with complete-linkage
table(run_km_sc$cluster,memb_complete)
