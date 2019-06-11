using Godot;

public enum ClothingType
{
    Shirts,
    Pants,
    Undies,
    Accessory
}

public class GameScn : Node
{
    void ChangeClothes(string path, ClothingType clothingType)
    {
        var texture = ResourceLoader.Load<Texture>($"res://{path}");

        switch (clothingType)
        {
            case ClothingType.Shirts:
                var top = GetNode<Sprite>("Nathan/Top");
                top.Texture = texture;
                break;
            case ClothingType.Pants:
                var bottom = GetNode<Sprite>("Nathan/Bottom");
                bottom.Texture = texture;
                break;
            case ClothingType.Undies:
                var undies = GetNode<Sprite>("Nathan/Undies");
                undies.Texture = texture;
                break;
            case ClothingType.Accessory:
                var accessory = GetNode<Sprite>("Nathan/Accessory");
                accessory.Texture = texture;
                break;
        }
    }

    TextureButton ClothingButton(string path, ClothingType clothingType)
    {
        switch (clothingType)
        {
            case ClothingType.Accessory:
                return GetNode<TextureButton>($"Clothes/Wordrobe/AccsGrid/{path}");
            case ClothingType.Undies:
                return GetNode<TextureButton>($"Clothes/Wordrobe/UndiesGrid/{path}");
            default:
            case ClothingType.Pants:
                return GetNode<TextureButton>($"Clothes/Wordrobe/PantsGrid/{path}");
            case ClothingType.Shirts:
                return GetNode<TextureButton>($"Clothes/Wordrobe/ShirtsGrid/{path}");
        }
    }

    public override void _Process(float delta)
    {
        // Change clothes
        if (ClothingButton("CanonCam", ClothingType.Accessory).IsPressed())
            ChangeClothes("sprites/camera.png", ClothingType.Accessory);
    }
}
