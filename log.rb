#some good log examples
logging = config.fetch('logging', {})
@log_device = Logger::LogDevice.new(logging.fetch('file', STDOUT))
@logger = Logger.new(@log_device)
@logger.level = Logger.const_get(logging.fetch('level', 'debug').upcase)
@logger.formatter = ThreadFormatter.new

# use a separate logger for redis to make it stfu
redis_logger = Logger.new(@log_device)
logging = config.fetch('redis', {}).fetch('logging', {})
redis_logger_level = logging.fetch('level', 'info').upcase
redis_logger.level = Logger.const_get(redis_logger_level)

# Event logger supposed to be overridden per task, the default one does nothing
@event_log = EventLog::Log.new
