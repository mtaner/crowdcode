module ProjectsHelper
	def prettify_date(date)
		date.strftime('%d/%m/%Y')
	end

	def format_date(date)
		date.strftime('%Y/%m/%d')
	end
end
