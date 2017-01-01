# func.R

#' Function to split a csv into a specified number of files
#'@param file_name character string indicating the path to a CSV file
#'@param n_files_output the number of files to be output
#'@details This function takes as inputs a file name for a CSV file and a specified number of files to split. It then splits the data frame output from reading the CSV file, rounding the number of rows in the data frame divided by the number of files to the ceiling, with the final split containing the rows remaining from the second to last split to the final row of the data frame output from reading the CSV File. The split files are saved to the working directory with a number appended to the original file name to indicate their position when split. The function does not return any values.
#'@export

split_csv <- function(file_name, n_files_output){

    df <- readr::read_csv(file_name)

    df_length <- ceiling(nrow(df) / n_files_output)

    df_list <- list()
    df_list[[1]] <- df[1:df_length, ]
    if(n_files_output > 2){
        for (i in 2:(n_files_output - 1)){
            df_list[[i]] <- df[((df_length*(i - 1)) + 1):(df_length*i), ]
        }
    }

    df_list[[n_files_output]] <- df[(df_length*(n_files_output - 1)):nrow(df), ]

    for (i in 1:n_files_output) {
        split_file_name <- strsplit(file_name, ".csv")

        message(paste0("Writing ", paste0(split_file_name, "-", i, ".csv", " (", i, "/", n_files_output, ")")))
        readr::write_csv(df_list[[i]], paste0(split_file_name, "-", i, ".csv"))

    }

}
