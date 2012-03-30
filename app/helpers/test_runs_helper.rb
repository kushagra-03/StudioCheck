module TestRunsHelper
  def result_icon(test_run)
    if test_run.result.nil?
      content_tag :span, :class => "label" do
        "Unknown"
      end
    else
      if test_run.result == true
        content_tag :span, :class => "label label-success" do
          "Passed"
        end
      else
        content_tag :span, :class => "label label-important" do
          "Failed"
        end
      end
    end
  end
end
