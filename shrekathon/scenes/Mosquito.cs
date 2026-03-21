using Godot;
using System;

public partial class Mosquito : CharacterBody2D
{
	public int speed = 100;
	public Vector2 velocity;
	public CharacterBody2D shrek;
	public bool right = true;
	public Vector2 shrekDirection;
	Vector2 moveDirection = new Vector2(1, 1); // Moves Down-Right
	public bool activated = false;
	private RandomNumberGenerator rng = new RandomNumberGenerator();
	public bool shaking = true;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		shrek = GetTree().CurrentScene.FindChild("Shrek(player)", true, false) as CharacterBody2D;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		
	}
	
	public override void _PhysicsProcess(double delta){
		if(activated){
			Move();
		}else{
			Shake();
		}
	}

	private void Move()
	{
		// 1. Assign to the BUILT-IN Velocity property
		Velocity = shrekDirection * speed;

		// 2. Tell Godot: "Take my current Velocity and move me now!"
		MoveAndSlide();
	}
	
	private void OnBodyEntered(Node body)
	{                 
		// Push player then die
		GD.Print("Area entered by: " + body.Name);
		if (body.Name == "Shrek(player)") 
		{
			GD.Print("Success! Mosquito hit Shrek.");
			// Push shrek
			shrek.Velocity += new Vector2(rng.RandfRange(-20f, 20f),-2d0) * 40;
			Kill();
		}
		
		//ToggleDirection();
	}

	public void Kill(){
		QueueFree();  
	}
	
	public void Activate(Node body) { 
		if(!activated && shrek != null && body == shrek) {
			shrekDirection = (shrek.GlobalPosition - GlobalPosition).Normalized();
			activated = true;
		}
	}
	
	public async void Shake(){
		Vector2 ogPosition = this.Position;
		this.Position = this.Position+new Vector2(rng.RandfRange(0.1f, 0.2f), rng.RandfRange(0.1f, 0.2f));
		await ToSignal(GetTree().CreateTimer(0.2f), "timeout");
		this.Position = ogPosition;
	}
	
	/* Antequated logic
	
	private void ToggleDirection(){
		if(right){
			GD.Print("We going left now.");
			moveDirection = new Vector2(1, 1);
		}else{
			GD.Print("We going right now.");
			moveDirection = new Vector2(-1, 1);
		}
		
		right = !right;
	} */
}
