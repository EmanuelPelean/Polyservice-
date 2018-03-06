/* ProgressBar - Functions for setting the current step.
 Allows for multiple Progress Bars per page (for whatever reason that may be desirable).
 Uses JQuery */
var ProgressBar = function(p_strId) {
	this._id = p_strId;
	
	var target = document.getElementById("target");

	var step1 = document.getElementById("step1");
	var step2 = document.getElementById("step2");
	var step3 = document.getElementById("step3");
	var step4 = document.getElementById("step4");


	/*
	 * Set the current step in the progress bar @param p_iStep The current step;
	 * not zero-based to match with visible step numbers @return true, if
	 * current step could be set; false otherwise
	 */
	this.setStep = function(p_iStep) {
		if (p_iStep === undefined || p_iStep.isNaN) {
			console.error("setStep() called with non-number argument");
			return false;
		}
		var l_aLi = $("#" + this._id + " li");
		if (p_iStep > 0 && p_iStep <= l_aLi.length) {
			$("#" + this._id + " .current").removeClass("current");
			l_aLi[p_iStep - 1].className = "current";
			$("#" + this._id + " .current").nextAll().addClass("todo");

			currentStep = $("#" + this._id + " .current").attr('id');

			checkStep(currentStep);

			return true;
		}
		return false;
	};

	// Next:
	this.nextStep = function() {
		var l_oCurr = $("#" + this._id + " li.current");
		if (l_oCurr.next().length == 0)
			return false;
		l_oCurr.removeClass("current");
		l_oCurr.next().removeClass("todo");
		l_oCurr.next().addClass("current");

		$("#" + this._id + " .current").nextAll().addClass("todo");

		currentStep = $("#" + this._id + " .current").attr('id');

		checkStep(currentStep);

		return true;
	};

	// Back:
	this.prevStep = function() {
		var l_oCurr = $("#" + this._id + " li.current");

		if (l_oCurr.prev().length == 0)
			return false;
		l_oCurr.removeClass("current");
		l_oCurr.prev().removeClass("todo");
		l_oCurr.prev().addClass("current");

		$("#" + this._id + " .current").nextAll().addClass("todo");

		currentStep = $("#" + this._id + " .current").attr('id');

		checkStep(currentStep);

		return true;
	};

	function checkStep(step) {
		if (step == 'li_1') {
			replaceDivElem(target, 'step1');
		} else if (step == 'li_2') {
			replaceDivElem(target, 'step2');
		} else if (step == 'li_3') {
			replaceDivElem(target, 'step3');
		} else if (step == 'li_4') {
			replaceDivElem(target, 'step4');
		}
	}
	
	function replaceDivElem(target, source){
		 target.innerHTML = document.getElementById(source).innerHTML;
	}
	

};// end of ProgressBar

// Initialize
var pbar2 = new ProgressBar("id_progressbar2");
pbar2.setStep(1);
