scriptId = 'com.thalmic.examples.myo-smash64'
scriptTitle = "main"
scriptDetailsUrl = ""

mouseCheck = false

function onForegroundWindowChange(app, title)
	myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
	if (title == "SMASH BROTHERS - Project64 Version 1.6") then
		return true
	else
		return false
	end
end

function onPoseEdge(pose, edge)
	myo.debug("onPoseEdge: " .. pose .. ", " .. edge)
	if(edge == "on") then
		if( (pose == "fist") and (mouseCheck == false)) then
			onFist1()
		elseif ((pose == "fist") and (mouseCheck == true)) then
			onFist2()
		elseif (pose == "doubleTap") then
			onUnlock()
		end
	end
end

function onFist1()
	myo.vibrate("medium")
	myo.controlMouse(true)
	mouseCheck = true
end

function onFist2()
	myo.vibrate("short")
	myo.controlMouse(false)
	mouseCheck = false
end

function onUnlock()
	myo.vibrate("short")
	myo.unlock("hold")
end