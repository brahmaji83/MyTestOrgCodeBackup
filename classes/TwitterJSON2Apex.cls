public class TwitterJSON2Apex {      
    
    public class Description {
        public List<Symbols> urls {get;set;}             
    }
    
    public class User {
        public Integer id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public String url {get;set;} 
        public Entities_Z entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Integer utc_offset {get;set;} 
        public String time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public String profile_background_image_url {get;set;} 
        public String profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_banner_url {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;} 
        
    }
    
    public class JSON2Apex {
        public List<Statuses> statuses {get;set;} 
        public Search_metadata search_metadata {get;set;} 
        
        
    }
    
    public class User_mentions_Z {
        public String screen_name {get;set;} 
        public String name {get;set;} 
        public Integer id {get;set;} 
        public String id_str {get;set;} 
        public List<Integer> indices {get;set;}           
    }
    
    public class Metadata {
        public String iso_language_code {get;set;} 
        public String result_type {get;set;}             
    }
    
    public class Url {
        public List<Urls> urls {get;set;} 
        
        
    }
    
    public class Bounding_box {
        public String type_Z {get;set;} // in json: type
        public List<List<List<Double>>> coordinates {get;set;} 
        
        
    }
    
    public class User_T {
        public Integer id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public Object url {get;set;} 
        public Entities_U entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Object utc_offset {get;set;} 
        public Object time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public String profile_background_image_url {get;set;} 
        public String profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_banner_url {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;} 
        
    }
    
    public class User_U {
        public Integer id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public String url {get;set;} 
        public Entities_Z entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Integer utc_offset {get;set;} 
        public String time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public String profile_background_image_url {get;set;} 
        public String profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;} 
        
        
    }
    
    public class User_V {
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public String url {get;set;} 
        public Entities_Z entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Object utc_offset {get;set;} 
        public Object time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public String profile_background_image_url {get;set;} 
        public String profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_banner_url {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;} 
        
    }
    
    public class User_W {
        public Integer id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public Object url {get;set;} 
        public Entities_U entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Integer utc_offset {get;set;} 
        public String time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public String profile_background_image_url {get;set;} 
        public String profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_banner_url {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;} 
        
    }
    
    public class User_X {
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public String url {get;set;} 
        public Entities_Z entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Object utc_offset {get;set;} 
        public Object time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public Object profile_background_image_url {get;set;} 
        public Object profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_banner_url {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;}                      
    }
    
    public class User_Y {
        public Integer id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public String url {get;set;} 
        public Entities_Z entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Object utc_offset {get;set;} 
        public Object time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public String profile_background_image_url {get;set;} 
        public String profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_banner_url {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;}                     
    }
    
    public class User_Z {
        public Integer id {get;set;} 
        public String id_str {get;set;} 
        public String name {get;set;} 
        public String screen_name {get;set;} 
        public String location {get;set;} 
        public String description {get;set;} 
        public String url {get;set;} 
        public Entities_W entities {get;set;} 
        public Boolean protected_Z {get;set;} // in json: protected
        public Integer followers_count {get;set;} 
        public Integer friends_count {get;set;} 
        public Integer listed_count {get;set;} 
        public String created_at {get;set;} 
        public Integer favourites_count {get;set;} 
        public Integer utc_offset {get;set;} 
        public String time_zone {get;set;} 
        public Boolean geo_enabled {get;set;} 
        public Boolean verified {get;set;} 
        public Integer statuses_count {get;set;} 
        public String lang {get;set;} 
        public Boolean contributors_enabled {get;set;} 
        public Boolean is_translator {get;set;} 
        public Boolean is_translation_enabled {get;set;} 
        public String profile_background_color {get;set;} 
        public String profile_background_image_url {get;set;} 
        public String profile_background_image_url_https {get;set;} 
        public Boolean profile_background_tile {get;set;} 
        public String profile_image_url {get;set;} 
        public String profile_image_url_https {get;set;} 
        public String profile_banner_url {get;set;} 
        public String profile_link_color {get;set;} 
        public String profile_sidebar_border_color {get;set;} 
        public String profile_sidebar_fill_color {get;set;} 
        public String profile_text_color {get;set;} 
        public Boolean profile_use_background_image {get;set;} 
        public Boolean has_extended_profile {get;set;} 
        public Boolean default_profile {get;set;} 
        public Boolean default_profile_image {get;set;} 
        public Object following {get;set;} 
        public Object follow_request_sent {get;set;} 
        public Object notifications {get;set;} 
        public String translator_type {get;set;} 
        
        
    }
    
    public class Retweeted_status_W {
        public String created_at {get;set;} 
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String text {get;set;} 
        public Boolean truncated {get;set;} 
        public Entities_S entities {get;set;} 
        public Metadata metadata {get;set;} 
        public String source {get;set;} 
        public Object in_reply_to_status_id {get;set;} 
        public Object in_reply_to_status_id_str {get;set;} 
        public Object in_reply_to_user_id {get;set;} 
        public Object in_reply_to_user_id_str {get;set;} 
        public Object in_reply_to_screen_name {get;set;} 
        public User_Z user {get;set;} 
        public Object geo {get;set;} 
        public Object coordinates {get;set;} 
        public Object place {get;set;} 
        public Object contributors {get;set;} 
        public Boolean is_quote_status {get;set;} 
        public Integer retweet_count {get;set;} 
        public Integer favorite_count {get;set;} 
        public Boolean favorited {get;set;} 
        public Boolean retweeted {get;set;} 
        public Boolean possibly_sensitive {get;set;} 
        public String lang {get;set;} 
        
    }
    
    public class Retweeted_status_X {
        public String created_at {get;set;} 
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String text {get;set;} 
        public Boolean truncated {get;set;} 
        public Entities_R entities {get;set;} 
        public Metadata metadata {get;set;} 
        public String source {get;set;} 
        public Object in_reply_to_status_id {get;set;} 
        public Object in_reply_to_status_id_str {get;set;} 
        public Object in_reply_to_user_id {get;set;} 
        public Object in_reply_to_user_id_str {get;set;} 
        public Object in_reply_to_screen_name {get;set;} 
        public User_Y user {get;set;} 
        public Object geo {get;set;} 
        public Object coordinates {get;set;} 
        public Object place {get;set;} 
        public Object contributors {get;set;} 
        public Boolean is_quote_status {get;set;} 
        public Integer retweet_count {get;set;} 
        public Integer favorite_count {get;set;} 
        public Boolean favorited {get;set;} 
        public Boolean retweeted {get;set;} 
        public Boolean possibly_sensitive {get;set;} 
        public String lang {get;set;} 
        
        
    }
    
    public class Retweeted_status_Y {
        public String created_at {get;set;} 
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String text {get;set;} 
        public Boolean truncated {get;set;} 
        public Entities entities {get;set;} 
        public Metadata metadata {get;set;} 
        public String source {get;set;} 
        public Object in_reply_to_status_id {get;set;} 
        public Object in_reply_to_status_id_str {get;set;} 
        public Object in_reply_to_user_id {get;set;} 
        public Object in_reply_to_user_id_str {get;set;} 
        public Object in_reply_to_screen_name {get;set;} 
        public User user {get;set;} 
        public Object geo {get;set;} 
        public Object coordinates {get;set;} 
        public Object place {get;set;} 
        public Object contributors {get;set;} 
        public Boolean is_quote_status {get;set;} 
        public Integer retweet_count {get;set;} 
        public Integer favorite_count {get;set;} 
        public Boolean favorited {get;set;} 
        public Boolean retweeted {get;set;} 
        public Boolean possibly_sensitive {get;set;} 
        public String lang {get;set;} 
        
    }
    
    public class Retweeted_status_Z {
        public String created_at {get;set;} 
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String text {get;set;} 
        public Boolean truncated {get;set;} 
        public Entities_T entities {get;set;} 
        public Metadata metadata {get;set;} 
        public String source {get;set;} 
        public Object in_reply_to_status_id {get;set;} 
        public Object in_reply_to_status_id_str {get;set;} 
        public Object in_reply_to_user_id {get;set;} 
        public Object in_reply_to_user_id_str {get;set;} 
        public Object in_reply_to_screen_name {get;set;} 
        public User_Z user {get;set;} 
        public Object geo {get;set;} 
        public Object coordinates {get;set;} 
        public Object place {get;set;} 
        public Object contributors {get;set;} 
        public Boolean is_quote_status {get;set;} 
        public Integer retweet_count {get;set;} 
        public Integer favorite_count {get;set;} 
        public Boolean favorited {get;set;} 
        public Boolean retweeted {get;set;} 
        public String lang {get;set;} 
        
    }
    
    public class Entities_U {
        public Description description {get;set;} 
        
    }
    
    public class Entities_T {
        public List<Hashtags> hashtags {get;set;} 
        public List<Symbols> symbols {get;set;} 
        public List<User_mentions_Z> user_mentions {get;set;} 
        public List<Symbols> urls {get;set;} 
        
    }
    
    public class Thumb {
        public Integer w {get;set;} 
        public Integer h {get;set;} 
        public String resize {get;set;} 
        
    }
    
    public class Entities_S {
        public List<Hashtags> hashtags {get;set;} 
        public List<Symbols> symbols {get;set;} 
        public List<User_mentions_Z> user_mentions {get;set;} 
        public List<Urls> urls {get;set;}                       
    }
    
    public class Entities_R {
        public List<Symbols> hashtags {get;set;} 
        public List<Symbols> symbols {get;set;} 
        public List<Symbols> user_mentions {get;set;} 
        public List<Urls> urls {get;set;}                       
    }
    
    public class Media {
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public List<Integer> indices {get;set;} 
        public String media_url {get;set;} 
        public String media_url_https {get;set;} 
        public String url {get;set;} 
        public String display_url {get;set;} 
        public String expanded_url {get;set;} 
        public String type_Z {get;set;} // in json: type
        public Sizes sizes {get;set;} 
        
    }
    
    public class Entities_Y {
        public List<Hashtags> hashtags {get;set;} 
        public List<Symbols> symbols {get;set;} 
        public List<User_mentions> user_mentions {get;set;} 
        public List<Symbols> urls {get;set;} 
        public List<Media> media {get;set;} 
        
    }
    
    public class Retweeted_status {
        public String created_at {get;set;} 
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String text {get;set;} 
        public Boolean truncated {get;set;} 
        public Entities_X entities {get;set;} 
        public Metadata metadata {get;set;} 
        public String source {get;set;} 
        public Object in_reply_to_status_id {get;set;} 
        public Object in_reply_to_status_id_str {get;set;} 
        public Object in_reply_to_user_id {get;set;} 
        public Object in_reply_to_user_id_str {get;set;} 
        public Object in_reply_to_screen_name {get;set;} 
        public User_Y user {get;set;} 
        public Object geo {get;set;} 
        public Object coordinates {get;set;} 
        public Place place {get;set;} 
        public Object contributors {get;set;} 
        public Boolean is_quote_status {get;set;} 
        public Integer retweet_count {get;set;} 
        public Integer favorite_count {get;set;} 
        public Boolean favorited {get;set;} 
        public Boolean retweeted {get;set;} 
        public String lang {get;set;}                         
    }
    
    public class Entities_X {
        public List<Symbols> hashtags {get;set;} 
        public List<Symbols> symbols {get;set;} 
        public List<User_mentions_Z> user_mentions {get;set;} 
        public List<Symbols> urls {get;set;} 
        
        
    }
    
    public class Entities_W {
        public Url url {get;set;} 
        public Url description {get;set;} 
        
        
    }
    
    public class Entities_V {
        public List<Symbols> hashtags {get;set;} 
        public List<Symbols> symbols {get;set;} 
        public List<User_mentions> user_mentions {get;set;} 
        public List<Urls> urls {get;set;} 
        
        
    }
    
    public class Urls {
        public String url {get;set;} 
        public String expanded_url {get;set;} 
        public String display_url {get;set;} 
        public List<Integer> indices {get;set;} 
        
    }
    
    public class Extended_entities {
        public List<Media> media {get;set;}                         
    }
    
    public class Entities {
        public List<Hashtags> hashtags {get;set;} 
        public List<Symbols> symbols {get;set;} 
        public List<Symbols> user_mentions {get;set;} 
        public List<Urls> urls {get;set;} 
        
        
    }
    
    public class Entities_Z {
        public Url url {get;set;} 
        public Description description {get;set;} 
        
    }
    
    public class Sizes {
        public Thumb thumb {get;set;} 
        public Thumb medium {get;set;} 
        public Thumb small {get;set;} 
        public Thumb large {get;set;}                         
    }
    
    public class Statuses {
        public String created_at {get;set;} 
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public String text {get;set;} 
        public Boolean truncated {get;set;} 
        public Entities entities {get;set;} 
        public Metadata metadata {get;set;} 
        public String source {get;set;} 
        public Object in_reply_to_status_id {get;set;} 
        public Object in_reply_to_status_id_str {get;set;} 
        public Object in_reply_to_user_id {get;set;} 
        public Object in_reply_to_user_id_str {get;set;} 
        public Object in_reply_to_screen_name {get;set;} 
        public User user {get;set;} 
        public Object geo {get;set;} 
        public Object coordinates {get;set;} 
        public Object place {get;set;} 
        public Object contributors {get;set;} 
        public Boolean is_quote_status {get;set;} 
        public Integer retweet_count {get;set;} 
        public Integer favorite_count {get;set;} 
        public Boolean favorited {get;set;} 
        public Boolean retweeted {get;set;} 
        public Boolean possibly_sensitive {get;set;} 
        public String lang {get;set;} 
        public Extended_entities extended_entities {get;set;} 
        public Retweeted_status retweeted_status {get;set;} 
        
        
        
    }
    
    public class Symbols {
        
        
    }
    
    public class Search_metadata {
        public Double completed_in {get;set;} 
        public Long max_id {get;set;} 
        public String max_id_str {get;set;} 
        public String next_results {get;set;} 
        public String query {get;set;} 
        public String refresh_url {get;set;} 
        public Integer count {get;set;} 
        public Integer since_id {get;set;} 
        public String since_id_str {get;set;} 
        
    }
    
    public class Hashtags {
        public String text {get;set;} 
        public List<Integer> indices {get;set;}                         
    }
    
    public class User_mentions {
        public String screen_name {get;set;} 
        public String name {get;set;} 
        public Long id {get;set;} 
        public String id_str {get;set;} 
        public List<Integer> indices {get;set;}                        
    }
    
    public class Place {
        public String id {get;set;} 
        public String url {get;set;} 
        public String place_type {get;set;} 
        public String name {get;set;} 
        public String full_name {get;set;} 
        public String country_code {get;set;} 
        public String country {get;set;} 
        public List<Symbols> contained_within {get;set;} 
        public Bounding_box bounding_box {get;set;} 
        public Symbols attributes {get;set;} 
        
    }
    
}