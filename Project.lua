local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Neon.C Hub [💎]", "Sentinel")

local Tab = Window:NewTab("🎯 Close Combat")

local Section = Tab:NewSection("Main")

Section:NewToggle("Auto Parry + Visualizer", "ToggleInfo", function(state)
    if state then getgenv().visualizer = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock"))()
    else
        print("Toggle Off")
    end
end)

Section:NewToggle("Auto Win", "ToggleInfo", function(state)
    if state then
getgenv().god = true
while getgenv().god and task.wait() do
    for _,ball in next, workspace.Balls:GetChildren() do
        if ball then
            if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, ball.Position)
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Highlight") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = ball.CFrame * CFrame.new(0, 0, (ball.Velocity).Magnitude * -0.5)
                    game:GetService("ReplicatedStorage").Remotes.ParryButtonPress:Fire()
                end
            end
        end
    end
end
    else
        print("Toggle Off")
    end
end)

Section:NewToggle("Auto Spam", "ToggleInfo", function(state)
    if state then
loadstring(game:HttpGet("https://pastebin.com/raw/t2391h1A"))()
    else
        print("Toggle Off")
    end
end)

Section:NewToggle("Auto Detect Spam", "ToggleInfo", function(state)
    if state then
getgenv().AutoDetectSpam = true

--///////////////////////////////////////////////////////////////////--

local Alive = workspace:WaitForChild("Alive", 9e9)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local ParryAttempt = Remotes:WaitForChild("ParryAttempt", 9e9)
local Balls = workspace:WaitForChild("Balls", 9e9)

--///////////////////////////////////////////////////////////////////--

local function get_ProxyPlayer()
  local Distance = math.huge
  local plrRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
  local PlayerReturn = nil
  
  for _,plr1 in pairs(Alive:GetChildren()) do
    if plr1:FindFirstChild("Humanoid") and plr1.Humanoid.Health > 50 then
      if plr1.Name ~= Player.Name and plrRP and plr1:FindFirstChild("HumanoidRootPart") then
        local magnitude = (plr1.HumanoidRootPart.Position - plrRP.Position).Magnitude
        if magnitude <= Distance then
          Distance = magnitude
          PlayerReturn = plr1
        end
      end
    end
  end
  return PlayerReturn
end

local function SuperClick()
  task.spawn(function()
    if IsAlive() and #Alive:GetChildren() > 1 then
      local args1 = 0.5
      local args2 = CFrame.new()
      local args3 = {["enzo"] = Vector3.new()}
      local args4 = {500, 500}
      
      if args1 and args2 and args3 and args4 then
        ParryAttempt:FireServer(args1, args2, args3, args4)
      end
    end
  end)
end

task.spawn(function()
  while task.wait() do
    if getgenv().SpamClickA and getgenv().AutoDetectSpam then
      SuperClick()
    end
  end
end)

local ParryCounter = 0
local DetectSpamDistance = 0

local function GetBall(ball)
  local Target = ""
  
  ball:GetPropertyChangedSignal("Position"):Connect(function()
    local PlayerPP = Player and Player.Character and Player.Character.PrimaryPart
    local NearestPlayer = get_ProxyPlayer()
    
    if ball and PlayerPP and NearestPlayer and NearestPlayer.PrimaryPart then
      local PlayerDistance = (PlayerPP.Position - NearestPlayer.PrimaryPart.Position).Magnitude
      local BallDistance = (PlayerPP.Position - ball.Position).Magnitude
      
      DetectSpamDistance = 25 + math.clamp(ParryCounter / 3, 0, 25)
      
      if ParryCounter > 2 and PlayerDistance < DetectSpamDistance and BallDistance < 55 then
        getgenv().SpamClickA = true
      else
        getgenv().SpamClickA = false
      end
    end
  end)
  ball:GetAttributeChangedSignal("target"):Connect(function()
    Target = ball:GetAttribute("target")
    local NearestPlayer = get_ProxyPlayer()
    
    if NearestPlayer then
      if Target == NearestPlayer.Name or Target == Player.Name then
        ParryCounter = ParryCounter + 1
      else
        ParryCounter = 0
      end
    end
  end)
end

for _,ball in pairs(Balls:GetChildren()) do
  if ball and not ball:GetAttribute("realBall") then
    return
  end
  
  GetBall(ball)
end

Balls.ChildAdded:Connect(function(ball)
  if not getgenv().AutoDetectSpam then
    return
  elseif ball and not ball:GetAttribute("realBall") then
    return
  end
  
  getgenv().SpamClickA = false
  ParryCounter = 0
  GetBall(ball)
end)
    else
        print("Toggle Off")
    end
end)

Section:NewToggle("Hold Block To Spam", "ToggleInfo", function(state)
    if state then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Script by Neoncat",
	Text = "Hold Block To Spam",
	Duration = 5
})

getgenv().SpamSpeed = 5 -- 1-25

if not getgenv().exeSpam then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Spam",true))()
end

getgenv().exeSpam = true
    else
        print("Toggle Off")
    end
end)

Section:NewToggle("Player Esp", "ToggleInfo", function(state)
    if state then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Neoncat765/PinkEsp/main/MainEsp"))();
    else
        print("Toggle Off")
    end
end)

Section:NewButton("Made by Neoncat", "Owner: Neoncat", function()
    print("Clicked")
end)

local HereSection = Tab:NewSection("Training Mode")

HereSection:NewButton("Auto Parry [TRAINING MODE ONLY]", "ButtonInfo", function()
local Debug = false -- Set this to true if you want my debug output.
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9) -- A second argument in waitforchild what could it mean?
local Balls = workspace:WaitForChild("Balls", 9e9)

-- Functions

local function print(...) -- Debug print.
    if Debug then
        warn(...)
    end
end

local function VerifyBall(Ball) -- Returns nil if the ball isn't a valid projectile; true if it's the right ball.
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

local function IsTarget() -- Returns true if we are the current target.
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end

local function Parry() -- Parries.
    Remotes:WaitForChild("ParryButtonPress"):Fire()
end

-- The actual code

Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end
    
    print(`Ball Spawned: {Ball}`)
    
    local OldPosition = Ball.Position
    local OldTick = tick()
    
    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then -- No need to do the math if we're not being attacked.
            local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude -- Fix for .Velocity not working. Yes I got the lowest possible grade in accuplacer math.
            
            print(`Distance: {Distance}\nVelocity: {Velocity}\nTime: {Distance / Velocity}`)
        
            if (Distance / Velocity) <= 10 then -- Sorry for the magic number. This just works. No, you don't get a slider for this because it's 2am.
                Parry()
            end
        end
        
        if (tick() - OldTick >= 1/60) then -- Don't want it to update too quickly because my velocity implementation is aids. Yes, I tried Ball.Velocity. No, it didn't work.
            OldTick = tick()
            OldPosition = Ball.Position
        end
    end)
end)
end)

local MainTab = Window:NewTab("💎 Socials")

local MainSection = Tab:NewSection("Main")

MainSection:NewButton("Youtube: @justneoncat", "@justneoncat", function()
    print("Clicked")
end)

MainSection:NewButton("Discord: neoncat0502", "neoncat0502", function()
    print("Clicked")
end)
